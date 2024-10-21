import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import DataLoader, TensorDataset


# Define your custom question-answering model
class SimpleQAModel(nn.Module):
    def __init__(self, input_size, hidden_size, output_size):
        super(SimpleQAModel, self).__init__()
        self.embedding = nn.Embedding(input_size, hidden_size)
        self.gru = nn.GRU(hidden_size, hidden_size)
        self.fc = nn.Linear(hidden_size, output_size)

    def forward(self, input_question):
        embedded = self.embedding(input_question)
        _, hidden = self.gru(embedded)
        output = self.fc(hidden[-1])
        return output


# Read data from files
def read_data(file_path):
    with open(file_path, "r", encoding="utf-8") as file:
        lines = file.readlines()
    return lines


# Load questions and answers
questions = read_data("train.from")
answers = read_data("train.to")

# Tokenization and indexing (replace with your own preprocessing)
vocab = {"<PAD>": 0}  # Add more tokens to the vocabulary if needed
indexed_questions = [
    [vocab.setdefault(word, len(vocab)) for word in question.split()]
    for question in questions
]

# Padding for variable-length sequences
max_len = max(len(question) for question in indexed_questions)
padded_questions = [
    question + [vocab["<PAD>"]] * (max_len - len(question))
    for question in indexed_questions
]

# Convert to PyTorch tensors
input_tensor = torch.tensor(padded_questions, dtype=torch.long)

# Define other hyperparameters
batch_size = 2
hidden_size = 32
output_size = 2  # Number of classes (answer or not)

# Create a TensorDataset and DataLoader
dataset = TensorDataset(input_tensor)
dataloader = DataLoader(dataset, batch_size=batch_size, shuffle=True)

# Initialize and train the model
model = SimpleQAModel(len(vocab), hidden_size, output_size)
criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(model.parameters(), lr=0.001)

# Training loop
for epoch in range(3):  # Adjust the number of training epochs
    model.train()
    for batch in dataloader:
        inputs = batch[0]
        targets = torch.tensor([0, 1])  # Dummy targets, replace with your labels

        optimizer.zero_grad()
        outputs = model(inputs)
        loss = criterion(outputs, targets)
        loss.backward()
        optimizer.step()

# Save the trained model (replace with your desired saving mechanism)
torch.save(model.state_dict(), "qa_model.pth")
