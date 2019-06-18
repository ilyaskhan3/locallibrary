from django.contrib import admin

# Register your models here.
from catalog.models import Author, Genre, Book, BookInstance, Language
##previous - this displays the model list
##in columnar style
##
#admin.site.register(Author)
admin.site.register(Genre)
#admin.site.register(Book)
#admin.site.register(BookInstance)
admin.site.register(Language)
##end previous ##

##start custom view improvement##
## we wish to improve the interface
## for Author, Book, and BookInstance
## steps
## 1. comment out Model in above
## 2. define admin class for Admin: syntax name_of_modelAdmin(admin.ModelAdmin)
## 3. register the admin class with associated model Author
# Author

# inline editing of book frrom authordetail
class BookInline(admin.TabularInline):
	model = Book
class AuthorAdmin(admin.ModelAdmin):
	## list_display and the field names in the tuple
	## display the fields in a row rather than in a column
	list_display = ('last_name', 'first_name', 'date_of_birth', 'date_of_death')
	list_filter = ('date_of_birth',)
	fields = ('first_name', 'last_name', ('date_of_birth', 'date_of_death'))
	inlines = [BookInline]
admin.site.register(Author, AuthorAdmin)
# Book
# we'll use @admin.register(Book)
# this does the same thing as admin.site.register(Book, BookAdmin)

# inline editing of bookinstance from bookdetail
class BookInstanceInline(admin.TabularInline):
	model = BookInstance
@admin.register(Book)
class BookAdmin(admin.ModelAdmin):
	# using same method as in Author, list_display
	# genre is a many-to-many field
	# so we use write a method in model
	#
	list_display = ('title', 'author', 'display_genre')
	inlines = [BookInstanceInline]
# BookInstance
@admin.register(BookInstance)
class BookInstanceAdmin(admin.ModelAdmin):
	list_display = ('book', 'status', 'due_back', 'borrower')
	fieldsets = (
        (None, {
            'fields': ('book', 'imprint', 'id')
        }),
        ('Availability', {
            'fields': ('status', 'due_back')
        }),
    )
