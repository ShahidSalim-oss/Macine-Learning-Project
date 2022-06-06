import pandas as pd

data = pd.read_csv('input.csv')

data.insert(2, "Team", "Any")

data.to_csv (r'clean.csv', index = False, header=True)
