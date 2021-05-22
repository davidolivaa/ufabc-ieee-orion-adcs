{3 4 7}
ans =
{
  [1,1] = 3
  [1,2] = 4
  [1,3] = 7
}

>> [5, 2, 6]
ans =

   5   2   6

>> A=[0: 5: 45]
A =

    0    5   10   15   20   25   30   35   40   45

>> linspace(0, 50, 20)
ans =

 Columns 1 through 7:

         0    2.6316    5.2632    7.8947   10.5263   13.1579   15.7895

 Columns 8 through 14:

   18.4211   21.0526   23.6842   26.3158   28.9474   31.5789   34.2105

 Columns 15 through 20:

   36.8421   39.4737   42.1053   44.7368   47.3684   50.0000

>> [3 4 8; 23 5 9; 1]
error: vertical dimensions mismatch (2x3 vs 1x1)
>> [3 4 8; 23 5 9; 1 0 0]
ans =

    3    4    8
   23    5    9
    1    0    0

>> zeros(3, 5)
ans =

   0   0   0   0   0
   0   0   0   0   0
   0   0   0   0   0

>> ones(3, 4)
ans =

   1   1   1   1
   1   1   1   1
   1   1   1   1

>> eyes(6, 2)
error: 'eyes' undefined near line 1, column 1
>> eye(6, 2)
ans =

Diagonal Matrix

   1   0
   0   1
   0   0
   0   0
   0   0
   0   0

>> eye(4)
ans =

Diagonal Matrix

   1   0   0   0
   0   1   0   0
   0   0   1   0
   0   0   0   1

>> M=[2 4 6; 19 7 7; 5 3 6]
M =

    2    4    6
   19    7    7
    5    3    6

>> M'
ans =

    2   19    5
    4    7    3
    6    7    6

>> M(3, 3)
ans = 6
>> A
A =

    0    5   10   15   20   25   30   35   40   45

>> A(2:5)
ans =

    5   10   15   20

>> ans
ans =

    5   10   15   20

>> M(:, 3)
ans =

   6
   7
   6

>> M(1, :)
ans =

   2   4   6

>> M(:, 2:3)
ans =

   4   6
   7   7
   3   6

>> M
M =

    2    4    6
   19    7    7
    5    3    6

>> M(2:3, 2:3)
ans =

   7   7
   3   6

>> M(1:2, 2:3)
ans =

   4   6
   7   7

>> m2 = [10:-1:6; ones(2, 5); 2:1:5]
error: vertical dimensions mismatch (3x5 vs 1x4)
>> m2 = [10:-1:6; ones(1, 5); 2:1:5; zeros(1, 5)]
error: vertical dimensions mismatch (2x5 vs 1x4)
>> m2 = [10:-1:6; ones(1, 5); 2:1:6; zeros(1, 5)]
m2 =

   10    9    8    7    6
    1    1    1    1    1
    2    3    4    5    6
    0    0    0    0    0

>> m2 = [10:-1:6; ones(2, 5); 2:1:6; zeros(1, 5)]
m2 =

   10    9    8    7    6
    1    1    1    1    1
    1    1    1    1    1
    2    3    4    5    6
    0    0    0    0    0

>> v
error: 'v' undefined near line 1, column 1
>> v = (0:2:10)
v =

    0    2    4    6    8   10

>> v(7) = 13
v =

    0    2    4    6    8   10   13

>> v(8: 10) = [5, 3, 8]
v =

    0    2    4    6    8   10   13    5    3    8

v(14) = 5
v =

    0    2    4    6    8   10   13    5    3    8    0    0    0    5

>> m
error: 'm' undefined near line 1, column 1
>> m2
m2 =

   10    9    8    7    6
    1    1    1    1    1
    1    1    1    1    1
    2    3    4    5    6
    0    0    0    0    0

>> M
M =

    2    4    6
   19    7    7
    5    3    6

>> M(:, 4) = [3, 8, 0]
M =

    2    4    6    3
   19    7    7    8
    5    3    6    0

>> M(4, :) = [2, 1, 5, 3]
M =

    2    4    6    3
   19    7    7    8
    5    3    6    0
    2    1    5    3

>> v
v =

    0    2    4    6    8   10   13    5    3    8    0    0    0    5

>> v(4)=[]
v =

    0    2    4    8   10   13    5    3    8    0    0    0    5

>> v(6:) = []
error: parse error:

  syntax error

>>> v(6:) = []
        ^
>> v(6:13) = []
v =

    0    2    4    8   10

>> M
M =

    2    4    6    3
   19    7    7    8
    5    3    6    0
    2    1    5    3

>> M(:, 2)=[]
M =

    2    6    3
   19    7    8
    5    6    0
    2    5    3

>> length(v)
ans = 5
>> size(M)
ans =

   4   3

>> m3 = (1 5 4; 2 8 4)
error: parse error:

  syntax error

>>> m3 = (1 5 4; 2 8 4)
            ^
>> m3 = [1 5 4; 2 8 4]
m3 =

   1   5   4
   2   8   4

>> reshape(m3, 3, 2)
ans =

   1   8
   2   4
   5   4

>> diag(v)
ans =

Diagonal Matrix

    0    0    0    0    0
    0    2    0    0    0
    0    0    4    0    0
    0    0    0    8    0
    0    0    0    0   10

>> diag(m3)
ans =

   1
   8

>> M
M =

    2    6    3
   19    7    8
    5    6    0
    2    5    3

>> M(4, :) = []
M =

    2    6    3
   19    7    8
    5    6    0

>> diag(M)
ans =

   2
   7
   0

>>
?