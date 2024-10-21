import langchain

ai = langchain.OpenAI()


def generate_post(title, author):

    prompt = f"Generate a blog post on '{title}' by {author}:"

    return ai.generate(prompt)


print(generate_post("Using LangChain", "Bijit Ghosh"))
