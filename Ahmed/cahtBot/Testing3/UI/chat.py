import tkinter as tk
from transformers import BertForQuestionAnswering, BertTokenizer
import torch

BG_GRAY = "#ABB2B9"
BG_COLOR = "#17202A"
TEXT_COLOR = "#EAECEE"
FONT = "Helvetica 14"
FONT_BOLD = "Helvetica 13 bold"


class ChatApplication:
    def __init__(self):
        self.window = tk.Tk()
        self._setup_main_window()
        self._load_model()

    def _load_model(self):
        # Load the pre-trained BERT model and tokenizer
        model_name = (
            ""  # Add your model name here ( or the location where is it placed)
        )
        self.model = BertForQuestionAnswering.from_pretrained(model_name)
        self.tokenizer = BertTokenizer.from_pretrained(model_name)

        # Define context
        self.context = ""  # Add your context here

    def run(self):
        self.window.mainloop()

    def _setup_main_window(self):
        self.window.title("Chatbot")
        self.window.configure(width=470, height=550, bg=BG_COLOR)

        head_label = tk.Label(
            self.window,
            bg=BG_COLOR,
            fg=TEXT_COLOR,
            text="Welcome",
            font=FONT_BOLD,
            pady=10,
        )

        head_label.place(relwidth=1)

        line = tk.Label(self.window, width=450, bg=BG_GRAY)
        line.place(relwidth=1, rely=0.07, relheight=0.012)

        self.text_widget = tk.Text(
            self.window,
            width=20,
            height=2,
            bg=BG_COLOR,
            fg=TEXT_COLOR,
            font=FONT,
            padx=5,
            pady=5,
        )
        self.text_widget.place(relheight=0.745, relwidth=1, rely=0.08)
        self.text_widget.configure(cursor="arrow", state=tk.DISABLED)

        scrollbar = tk.Scrollbar(self.text_widget)
        scrollbar.place(relheight=1, relx=0.974)
        scrollbar.configure(command=self.text_widget.yview)

        bottom_label = tk.Label(self.window, bg=BG_GRAY, height=80)
        bottom_label.place(relwidth=1, rely=0.825)

        self.message_entry = tk.Entry(
            bottom_label, bg="#2C3E50", fg=TEXT_COLOR, font=FONT
        )
        self.message_entry.place(relwidth=0.74, relheight=0.06, rely=0.008, relx=0.011)
        self.message_entry.focus()
        self.message_entry.bind("<Return>", self.send_message)

        send_button = tk.Button(
            bottom_label,
            text="Send",
            font=FONT_BOLD,
            width=20,
            bg=BG_GRAY,
            command=lambda: self.send_message(),
        )
        send_button.place(relx=0.77, rely=0.008, relheight=0.06, relwidth=0.22)

    def get_response(self, question):
        # Tokenize the input text
        inputs = self.tokenizer(question, self.context, return_tensors="pt")

        outputs = self.model(**inputs)

        # Decode and return the response
        answer_start_scores = outputs.start_logits
        answer_end_scores = outputs.end_logits
        answer_start = torch.argmax(answer_start_scores)
        answer_end = torch.argmax(answer_end_scores) + 1
        answer = self.tokenizer.convert_tokens_to_string(
            self.tokenizer.convert_ids_to_tokens(
                inputs["input_ids"][0][answer_start:answer_end],
                skip_special_tokens=True,
            )
        )
        return answer

    def send_message(self, event=None):
        user_message = self.message_entry.get().strip()
        if user_message:
            self._update_chat_history("You: " + user_message)
            self.message_entry.delete(0, tk.END)

            # Get response from chatbot
            bot_response = self.get_response(user_message)
            self._update_chat_history("Chatbot: " + bot_response)

    def _update_chat_history(self, message):
        self.text_widget.config(state=tk.NORMAL)
        self.text_widget.insert(tk.END, message + "\n")
        self.text_widget.config(state=tk.DISABLED)
        self.text_widget.see(tk.END)


if __name__ == "__main__":
    app = ChatApplication()
    app.run()
