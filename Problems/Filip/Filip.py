import io, os

def Filip():
    line = str(input().decode()).replace('\n','')
    n1, n2 = [int(x) for x in line[::-1].split(' ')]
    print(max(n1, n2))

def max(a, b):
    if a > b: return a 
    else: return b

if __name__ == '__main__':
    # Husk at bruge .decode() på input(), hvis det er at du skal læse strings 
    # Tak til https://www.geeksforgeeks.org/fast-i-o-for-competitive-programming-in-python/
    input = io.BytesIO(os.read(0, os.fstat(0).st_size)).readline
    Filip()