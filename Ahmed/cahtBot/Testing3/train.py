import torch
from torch.utils.data import DataLoader, TensorDataset
from transformers import BertForQuestionAnswering, BertTokenizer
from transformers import AdamW, get_linear_schedule_with_warmup

if __name__ == "__main__":
    # Check if a GPU is available and use it, otherwise use CPU
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

    # Set your desired batch size
    batch_size = 4  # or any smaller value

    # Load pre-trained BERT model and tokenizer
    model_name = "bert-base-uncased"
    model = BertForQuestionAnswering.from_pretrained(model_name).to(device)
    tokenizer = BertTokenizer.from_pretrained(model_name)

    print("Model initiated")

    # Example Q&A pairs (replace with your dataset)
    qa_pairs = []
    questions = []
    answers = []

    max_len = 512  # Adjust the maximum sequence length

    with open(
        "train.from", "r", encoding="utf-8"
    ) as file:  # Replace with your file path containig the question
        for line in file:
            questions.append(line)

    with open(
        "train.to", "r", encoding="utf-8"
    ) as file:  # replace with you file path containing the context
        for line in file:
            answers.append(line)

    print("Data collected")

    for i in range(len(questions)):
        qa_pairs.append({"question": questions[i], "answer": answers[i]})

    # Tokenize and format the data
    formatted_data = []
    for pair in qa_pairs:
        encoded_data = tokenizer(
            pair["question"],
            pair["answer"],
            return_tensors="pt",
            truncation=True,
            padding="max_length",
            max_length=max_len,
        )
        formatted_data.append(encoded_data)

    print("Data formatted")

    # Combine and stack tensors
    input_ids = torch.cat([data["input_ids"] for data in formatted_data], dim=0).to(
        device
    )
    attention_mask = torch.cat(
        [data["attention_mask"] for data in formatted_data], dim=0
    ).to(device)

    print("Validating data")

    # Check if start_positions and end_positions keys are present
    if "start_positions" in formatted_data[0] and "end_positions" in formatted_data[0]:
        start_positions = torch.cat(
            [data["start_positions"] for data in formatted_data], dim=0
        ).to(device)
        end_positions = torch.cat(
            [data["end_positions"] for data in formatted_data], dim=0
        ).to(device)
    else:
        # Adjust this part according to how your labels are structured
        start_positions = torch.tensor([0] * len(formatted_data), dtype=torch.long).to(
            device
        )
        end_positions = torch.tensor([0] * len(formatted_data), dtype=torch.long).to(
            device
        )

    print("Defining Dataset")

    # Create a TensorDataset
    dataset = TensorDataset(input_ids, attention_mask, start_positions, end_positions)

    # Create a DataLoader
    dataloader = DataLoader(dataset, batch_size=batch_size, shuffle=True)

    # Define training parameters
    optimizer = AdamW(model.parameters(), lr=5e-5)
    scheduler = get_linear_schedule_with_warmup(
        optimizer, num_warmup_steps=0, num_training_steps=len(dataloader) * 3
    )

    print("Starting Training")

    # Training loop
    for epoch in range(3):  # Adjust the number of training epochs
        model.train()
        for batch in dataloader:
            # Unpack the batch
            (
                batch_input_ids,
                batch_attention_mask,
                batch_start_positions,
                batch_end_positions,
            ) = batch

            optimizer.zero_grad()

            outputs = model(
                batch_input_ids,
                attention_mask=batch_attention_mask,
                start_positions=batch_start_positions,
                end_positions=batch_end_positions,
            )
            loss = outputs.loss
            loss.backward()

            optimizer.step()
            scheduler.step()

    # Save the fine-tuned model
    model.save_pretrained("Model_Trained")
    tokenizer.save_pretrained("Model_Trained")

    print("model saved")
