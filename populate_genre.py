import os
# os.environ.setdefault('DJANGO_SETTINGS_MODULE','first_projec.settings')
os.environ.setdefault('DJANGO_SETTINGS_MODULE','locallibrary.settings')

import django
django.setup()

## FAKE POP SCRIPT
import random
# from first_app.models import AccessRecord,Webpage,Topic
from catalog.models import Genre

from faker import Faker

fakegen = Faker()
genres = ["Action and adventure","Alternate history","Anthology","Chick lit","Children's",\
"Comic book","Coming-of-age","Crime","Drama","Fairytale","Fantasy","Graphic novel",\
"Historical fiction","Horror","Mystery","Paranormal romance","Picture book","Poetry",\
"Political thriller","Romance","Satire","Science fiction","Short story","Suspense",\
"Thriller","Young adult","Art","Autobiography","Biography","Book review","Cookbook",\
"Diary","Dictionary","Encyclopedia","Guide","Health","History","Journal","Math","Memoir",\
"Prayer", "Religion", "spirituality","New age","Textbook","Review","Science","Self help", "Travel", "True crime"
]

def add_genre():
    n = len(genres)
    for i in range(n):
        g = Genre(name=genres[i])
        g.save()

if __name__ == '__main__':
    print("populating genre script!")
    add_genre()
    print("populating genre complete!")
