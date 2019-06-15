import random
from faker import Faker


def showName():
    genre=['Science Fiction', 'Fantasy', 'Western', 'French Poetry', 'Religion']
    f = Faker()
    for i in range(len(genre)):
        print(genre[i])

    print(f.words(nb=4,ext_word_list=genre))


if __name__ == '__main__':
    showName()
