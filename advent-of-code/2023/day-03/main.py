import re


FILE = "input-example.txt"

with open(FILE, "r") as f:
    data_rows = f.readlines()
    data = ''.join(data_rows).replace("\n", "")

n_rows = len(data_rows)
n_cols = len(data) / n_rows

nums = [(m.start(0), m.end(0)-1) for m in re.finditer(r'\d+', data)]
chars = [m.start() for m in re.finditer(r"[^0-9.]+", data)]

print(chars)
print(nums)

print(n_rows)
print(n_cols)
print(data)

