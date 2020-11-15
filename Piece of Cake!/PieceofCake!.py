import io, os

def PieceofCake():
    data = str(input().decode())
    n, h, v = [int(x) for x in data.split(' ')]
    volumes = [
        h * v * 4,
        (n-v) * h * 4,
        (n - h) * v * 4,
        (n - v) * (n - h) * 4
    ]

    print(max(0, volumes))

def max(v, vs) -> int:
    if len(vs) == 0:
        return v
    else:
        if vs[0] > v:
            v = vs[0]
        return max(v, vs[1:len(vs)])


if __name__ == '__main__':
    # Husk at bruge .decode() på input(), hvis det er at du skal læse strings 
    # Tak til https://www.geeksforgeeks.org/fast-i-o-for-competitive-programming-in-python/
    input = io.BytesIO(os.read(0, os.fstat(0).st_size)).readline
    PieceofCake()