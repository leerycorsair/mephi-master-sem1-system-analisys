# Libraries
import matplotlib.pyplot as plt
import pandas as pd
from math import pi

# Set data
df = pd.DataFrame(
    {
        "group": ["A", "B", "C", "D"],
        "ПИС": [3.7, 4.1, 4.4, 3.4],
        "ООП": [4.8, 4.0, 4.5, 3.8],
        "ФП": [4.4, 3.5, 23, 24],
        "ЛинАл": [3.4, 3.6, 33, 14],
        "МатАн": [4.5, 3.6, 32, 14],
    }
)

# ------- PART 1: Create background

# number of variable
categories = list(df)[1:]
N = len(categories)

# What will be the angle of each axis in the plot? (we divide the plot / number of variable)
angles = [n / float(N) * 2 * pi for n in range(N)]
angles += angles[:1]

# Initialise the spider plot
ax = plt.subplot(111, polar=True)

# If you want the first axis to be on top:
ax.set_theta_offset(pi / 2)
ax.set_theta_direction(-1)

# Draw one axe per variable + add labels
plt.xticks(angles[:-1], categories)

# Draw ylabels
ax.set_rlabel_position(0)
plt.yticks([1, 2, 3, 4, 5], ["1", "2", "3", "4", "5"], color="grey", size=7)
plt.ylim(0, 5)


# ------- PART 2: Add plots

# Plot each individual = each line of the data
# I don't make a loop, because plotting more than 3 groups makes the chart unreadable

# Ind1
values = df.loc[0].drop("group").values.flatten().tolist()
values += values[:1]
ax.plot(angles, values, linewidth=1, linestyle="solid", label="Средняя успеваемость в рамках\nвсего направления обучения")
ax.fill(angles, values, "b", alpha=0.1)

# Ind2
values = df.loc[1].drop("group").values.flatten().tolist()
values += values[:1]
ax.plot(angles, values, linewidth=1, linestyle="solid", label="Средняя успеваемость в рамках\nконкретной группы")
ax.fill(angles, values, "r", alpha=0.1)

# Add legend
plt.legend(loc="upper right", bbox_to_anchor=(0.1, 0.1))

# Show the graph
plt.show()
