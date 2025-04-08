import matplotlib.pyplot as plt
from numpy import arange, linspace, where, zeros_like

period = 0.1
ns = arange(0, 6)
yn = 0.7**ns

# Plotting interval (choose bounds spanning nonzero region).
t = linspace(-0.1, 0.7, 1000)

# 4a
# p = lambda t: where((t > -0.05) & (t <= 0.05), 1.0, 0.0)
# 4b
# p = lambda t: where((t > -0.1) & (t <= 0.1), 1 - 10 * abs(t), 0)


yt = zeros_like(t)
for n, y in zip(ns, yn):
    yt += y * p(t - n * period)

plt.plot(t, yt)
plt.xlabel("t (s)")
plt.ylabel("y(t)")
plt.grid(True)
plt.show()
