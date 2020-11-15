import io, os

def NastyHacks():
    N = int(input())
    for i in range(N):
        data = str(input().decode()).split(' ')
        r, e, c = [int(x) for x in data]
        n = e - c
        if r > n:
            print("do not advertise")
        elif r < n:
            print("advertise")
        else:
            print("does not matter")

if __name__ == '__main__':
    # Husk at bruge .decode() på input(), hvis det er at du skal læse strings 
    # Tak til https://www.geeksforgeeks.org/fast-i-o-for-competitive-programming-in-python/
    input = io.BytesIO(os.read(0, os.fstat(0).st_size)).readline
    NastyHacks()