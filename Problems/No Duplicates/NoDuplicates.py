import io, os

def NoDuplicates():
    data = str(input().decode()).replace('\n', '').split(' ')
    buffer = list()
    duplicates_found = False

    for word in data:
        if word not in buffer:
            buffer.append(word)
        else:
            duplicates_found = True
            print('no')
            break
    if not duplicates_found:
        print('yes')
            

if __name__ == '__main__':
    # Husk at bruge .decode() på input(), hvis det er at du skal læse strings 
    # Tak til https://www.geeksforgeeks.org/fast-i-o-for-competitive-programming-in-python/
    input = io.BytesIO(os.read(0, os.fstat(0).st_size)).readline
    NoDuplicates()