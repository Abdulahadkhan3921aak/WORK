questions = []
answers = []
skip_lines = []
max_lim = 10000
i = 0
j = 0
line_number1 = 1
line_number2 = 1

with open("train.from", "r", encoding="utf-8") as file:
    for line in file:
        if len(line) < 45:
            questions.append(line)
            i += 1
            if i > max_lim:
                break
        else:
            skip_lines.append(line_number1)
        line_number1 += 1
    file.close()


with open("train.to", "r", encoding="utf-8") as file:
    for line in file:
        if len(line) < 60 and line_number2 not in skip_lines:
            answers.append(line)
            j += 1
            if j > max_lim:
                break
        line_number2 += 1
    file.close()


with open("test.from", "w", encoding="utf-8") as file:
    for q in questions:
        file.write(f"{q}")
    file.close()


with open("test.to", "w", encoding="utf-8") as file:
    for a in answers:
        file.write(f"{a}")
    file.close()
