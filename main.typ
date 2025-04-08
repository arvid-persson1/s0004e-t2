#set heading(numbering: "1a.")

=

We notice that all of the spectrums are symmetric, meaning all of the
corresponding signals can be expressed as sums of sinusoids. This allows us to
simplify the inverse discrete Fourier transform by considering only
nonnegative frequencies as

$
x(t) = Re sum_k A_k dot.op e^(2pi i f_k t) = sum_(k: f_k >= 0) (2 - delta(f_k, 0)) |A_k| cos(2pi f_k t + arg A_k).
$

The delta term serves to ensure that a potential constant ($f = 0$) is not
doubled in magnitude. Applying the above formula to each spectrum yields the
following signals:

+ $2 + 3cos(2.4pi t + 0.5pi)$
+ $3cos(1.2pi t - 0.25pi) + 3cos(3pi t + pi)$
+ $2 + 3cos(2.4pi t - 0.25pi)$
+ $3cos(2.4pi t - 0.25pi) + 3cos(4pi t + pi)$
+ $3cos(3pi t + pi)$

By visual inspection, we can uniquely identify each waveform by
inspecting its behavior around $t = 0$. We observe the following:

#set enum(numbering: "a.")
+ $x(0) > 0$, $x'(0) > 0$, $x''(0) < 0$
+ $x(0) < 0$, $x'(0) = 0$, $x''(0) > 0$
+ $x(0) > 0$, $x'(0) < 0$, $x''(0) = 0$
+ $x(0) < 0$, $x'(0) > 0$, $x''(0) > 0$
+ $x(0) < 0$, $x'(0) > 0$, $x''(0) > 0$
#set enum(numbering: "1.")

Using the calculated expressions for the signals, we find the following
pairings:

1. c
2. d
3. a
4. e
5. b

=

$
x(t) &= cos(70pi t) cos(2000pi t) \
     &= ((e^(70pi i t) + e^(-70 pi i t)) / 2) ((e^(2000pi i t) + e^(-2000 pi i t)) / 2) \
     &= 1/4 (e^(2070pi i t) + e^(1930 pi i t) + e^(-1930 pi i t) + e^(-2070 pi i t))
$

==

#figure(
  image("images/freqs1.png"),
  caption: "Frequency spectrum.",
)

==

$
f_s > 2f_max = 4140
$

=

==

The trivial solution is given by substituting $t = n T_s$ (with
$T_s = 1/f_s = 0.001$) into the expression for the discrete signal:

$
x_1(t) = 10cos(170pi t + pi/13).
$

Due to aliasing, all signals

$
10cos((0.17 + 2k)pi t + pi/13)
$

with $k in ZZ$ will be identical in discrete time with the given sampling
frequency. The given discrete signal is the principal alias (as $|0.17| <= 1$).
Choose $k = 1$ to find

$
x_2(t) = 10cos(2170pi t + pi/13).
$

==

The spectrum corresponds to the signal

$
x(t) &= 22cos(400pi t + (2pi)/5) + 10cos(1000pi t + (3pi)/5) \
     &= 22cos(4/7 f_s pi t + (2pi)/5) + 10cos(10/7 f_s pi t + (3pi)/5).
$

As $|10/7| > 1$, we see that this is not the principal alias. Substituting this
frequency with $10/7 - 1 = -4/7$ yields the signal

$
y(t) &= 22cos(4/7 f_s pi t + (2pi)/5) + 10cos(-4/7 f_s pi t + (3pi)/5) \
     &= 22cos(4/7 f_s pi t + (2pi)/5) + 10cos(4/7 f_s pi t - (3pi)/5) \
     &= 12cos(4/7 f_s pi t + (2pi)/5),
$

which produces the same values when sampled with $f_s$.

=

==

#figure(
  image("images/cont1.png"),
  caption: "Continous-time waveform.",
)

==

#figure(
  image("images/cont2.png"),
  caption: "Continous-time waveform.",
)

=

==

The sampling obeys the Nyquist-Shannon theorem, that is

$
f_s > 2f_max = 350
$

==

$
x[n] &= 2cos(2/5 pi n + pi/2) + cos(7/5 pi n) \
     &= 2cos(2/5 pi n + pi/2) + cos(3/5 pi n)
$

==

#figure(
  image("images/freqs2.png"),
  caption: "Frequency spectrum.",
)

==

By inspecting the points at which the signals coincide,

$
2cos(100pi t + pi/2) + cos(350pi t) &= 2cos(100pi t + pi/2) + 1 \
cos(350pi t) &= 1 \
350pi t &= 2pi k & k in ZZ \
t &= 1/175 k,
$

we find $T_s = 1/175$ meaning $f_s = 175$.

=

==

We express the position of the spot as a function of time as a general phasor:

$
p(t) = r e^(2pi i f t + phi i).
$

The constant speed of $13$ revolutions per second tells us that $f = -13$. The
negative sign is to be interpreted as an inversion in the direction; a speed of
$13$ clockwise. For the flashing rate at $15$ flashes per second, we choose
$t = n/15$. As $t = 0$ when $n = 0$, the spot being at the top at $n = 0$
tells us that $phi = pi/2$. We get the sampled result

$
p[n] &= r e^(-2pi i 13/15 n + pi/2 i) \
     &= r e^(2pi i 2/15 n + pi/2 i)
$

==

Substituting back $n = 15t$;

$
p(t) = r e^(2pi i 2 t + pi/2 i),
$

we see the apparent speed of $2$. Note the positive sign, meaning the spot
appears to be moving counter-clockwise.

==

Assume the phase is $0$. $15 degree$ per flash means one apparent revolution
every $360/15 = 24$ flashes. This gives us the sampled phasor

$
p[n] = e^(2pi i 1/24 n).
$

The actual phasor is on the form

$
p(t) = e^(2pi i f t).
$

As we sample at $13$ flashes per second,

$
p[n] = e^(2pi i f 1/13 n).
$

Putting this together,

$
e^(2pi i 1/24 n) &= e^(2pi i f 1/13 n) \
2pi i 1/24 n &= 2pi i f 1/13 n + 2pi i k n quad & k in ZZ \
1/24 &= 1/13 f + k \
f &= 13/24 + 13k & k |-> -k
$

/* ==

Given the speed $v$, the normalized radian frequency is

$
hat(omega) = (2pi v)/f_s = -26/15pi.
$

The negative value for $hat(omega)$ is interpreted as a change in direction;
that is, the normalized angular frequency is $26/15pi$ in the counterclockwise
direction. This gives us the phasor

$
p[n] = e^(-26/15pi i n).
$

==

We sample the signal and attempt an ideal reconstruction $y$:

$
x[n] = cos(26/15pi n) = cos(-4/15pi n).
$

Inverting the expression for the normalized radian frequency, we find the
apparent speed $v'$:

$
v' = f_s/(2 pi) hat(omega) = -2.
$


==

Assume the angular speed $omega$ is constant. Then, the angle for flash $n$ is

$
theta[n] = arg e^(omega i n).
$

We want to determine all $omega$ such that
$theta[n+1] - theta[n] = 15 degree = pi/12$. Choosing $n = 0$:

$
arg e^(omega i 1) - arg e^(omega i 0) &= pi/12 \
arg e^(omega i) - arg 1 &= pi/12 \
arg e^(omega i) &= pi/12 \
omega &= pi/12 + 2pi k quad & k in ZZ
$ */
