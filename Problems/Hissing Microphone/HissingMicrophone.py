import io, os

def HissingMicrophone():
    line = input().decode()
    if "ss" in line:
        
        print("hiss")
    else:
        print("no hiss")

if __name__ == '__main__':
    # Husk at bruge .decode() på input(), hvis det er at du skal læse strings 
    # Tak til https://www.geeksforgeeks.org/fast-i-o-for-competitive-programming-in-python/
    input = io.BytesIO(os.read(0, os.fstat(0).st_size)).readline
    HissingMicrophone()