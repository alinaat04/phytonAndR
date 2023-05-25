import pandas as pd
data = pd.read_csv("election_data.csv")
vote_count = data.groupby("candidate")["votes"].sum().reset_index()
import matplotlib.pyplot as plt
plt.pie(vote_count["votes"], labels=vote_count["candidate"], autopct=‘%1.1f%%’)
plt.show()
from scipy import stats
z_scores = stats.zscore(data["votes"])
anomalies = data[abs(z_scores) > 3]
