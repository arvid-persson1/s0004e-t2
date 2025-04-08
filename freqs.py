import matplotlib.pyplot as plt
from numpy import abs, angle, array, exp, pi

# 2a
# fs = array([-2070, -1930, 1930, 2070])
# ams = array([1 / 4, 1 / 4, 1 / 4, 1 / 4])

# 5c
# NOTE: normalized radian frequency.
fs = array([2 / 5 * pi, -2 / 5 * pi, 3 / 5 * pi, -3 / 5 * pi])
ams = array([exp(pi / 2 * 1j), exp(-pi / 2 * 1j), 1 / 2, 1 / 2])

ms = abs(ams)
ps = angle(ams)

plt.stem(fs, ms)
for f, m, a in zip(fs, ms, ams):
    plt.text(f + 0.01, m + 0.01, f"{a:.2f}", fontsize=20, bbox={"facecolor": "white"})
plt.xlabel("Normalized radian frequency", fontsize=20)
plt.ylabel("Magnitude", fontsize=20)
plt.grid(True)
plt.show()
