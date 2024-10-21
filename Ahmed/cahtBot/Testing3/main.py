from transformers import BertForQuestionAnswering, BertTokenizer
from transformers import pipeline

if __name__ == "__main__":
    # Your main code here
    # Load pre-trained BERT model and tokenizer
    model_name = "Model"
    model = BertForQuestionAnswering.from_pretrained(model_name)
    tokenizer = BertTokenizer.from_pretrained(model_name)

    # Fine-tune the model on your Q&A dataset (example not provided here)

    # Example usage for generating answers
    qa_pipeline = pipeline("question-answering", model=model, tokenizer=tokenizer)

    user_question = "The problem is, the loudest Christians are the most extreme, so Atheists must get angry &amp; loud in order to make the problem obvious.  I would say more moderate Christians should get loud too, but perhaps that's a contradiction in-itself?"
    context = "Agreed, we need to get out there and shout, 'MODERATION!!'"

    result = qa_pipeline(question=user_question, context=context)
    print("Chatbot Answer:", result["answer"])

    model.save_pretrained("Model")
    tokenizer.save_pretrained("Model")
