from django.shortcuts import render
from django.db.models import Q
from django.views import generic
# for on-loan books
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import permission_required
# for book renewal forms
import datetime

from django.contrib.auth.decorators import permission_required
from django.shortcuts import get_object_or_404
from django.http import HttpResponseRedirect
from django.urls import reverse

from catalog.forms import RenewBookForm

# for create, update, and delete
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy

from catalog.models import Author

# Create your views here.
from catalog.models import Book, Author, BookInstance, Genre

def index(request):
    """View function for home page of site."""

    # Generate counts of some of the main objects
    num_books = Book.objects.all().count()
    num_instances = BookInstance.objects.all().count()

    # Available books (status = 'a')
    num_instances_available = BookInstance.objects.filter(status__exact='a').count()

    # The 'all()' is implied by default.
    num_authors = Author.objects.count()

    # Session data
    # Number of visits to this view, as counted
    # in the session variable
    num_visits = request.session.get('num_visits', 0)
    request.session['num_visits'] = num_visits + 1


    # by IK # of books that contain a certain keyword
    # identify key words
    # for each word in key_words as key,
    #   filter the Books that contain in thier summary or title and count them
    #   return the title of the books from above
    #   from Genre filter the related books that contain the word in summary or title and count unique


    key_words =["Kothe",'magically' , 'trebon', 'Wind', 'sea', 'Temerant', 'Kerak']
    key_word_count = {}
    bks = []


    for word in range(len(key_words)):
    	key_word_count[key_words[word]]=[
    		Book.objects.all().filter(Q(summary__icontains=key_words[word]) | Q(title__icontains=key_words[word])).count,
            Genre.objects.all().filter(Q(book__summary__icontains=key_words[word]) | Q(book__title__icontains=key_words[word])).distinct().count(),
            Book.objects.all().filter(Q(summary__icontains=key_words[word]) | Q(title__icontains=key_words[word])),
    	    ]

    context = {
        'num_books': num_books,
        'num_instances': num_instances,
        'num_instances_available': num_instances_available,
        'num_authors': num_authors,
        'books': Book.objects.all(),
        'key_words': key_words,
        'key_word_count': key_word_count,
        'num_visits': num_visits,
    }

    # Render the HTML template index.html with the data in the context variable
    return render(request, 'index.html', context=context)

## view for a user's loaned books
## visible to the user only

class LoanedBooksByUserListView(LoginRequiredMixin,generic.ListView):
    """Generic class-based view listing books on loan to current user."""
    model = BookInstance
    template_name ='catalog/bookinstance_list_borrowed_user.html'
    paginate_by = 10

    def get_queryset(self):
        return BookInstance.objects.filter(borrower=self.request.user).filter(status__exact='o').order_by('due_back')

#########View for Book List page

class BookListView(generic.ListView):
    model=Book
    paginate_by = 10
### View for Book Detail page
class BookDetailView(generic.DetailView):
    model = Book
#########View for Author List page
class AuthorListView(generic.ListView):
    model=Author
### View for Book Detail page
class AuthorDetailView(generic.DetailView):
    model = Author

## view for book loan renewal form
@permission_required('catalog.can_mark_returned')
def renew_book_librarian(request, pk):
    """View function for renewing a specific BookInstance by librarian."""
    book_instance = get_object_or_404(BookInstance, pk=pk)

    # If this is a POST request then process the Form data
    if request.method == 'POST':

        # Create a form instance and populate it with data from the request (binding):
        form = RenewBookForm(request.POST)

        # Check if the form is valid:
        if form.is_valid():
            # process the data in form.cleaned_data as required (here we just write it to the model due_back field)
            book_instance.due_back = form.cleaned_data['renewal_date']
            book_instance.save()

            # redirect to a new URL:
            return HttpResponseRedirect(reverse('all-borrowed') )

    # If this is a GET (or any other method) create the default form.
    else:
        proposed_renewal_date = datetime.date.today() + datetime.timedelta(weeks=3)
        form = RenewBookForm(initial={'renewal_date': proposed_renewal_date})

    context = {
        'form': form,
        'book_instance': book_instance,
    }

    return render(request, 'catalog/book_renew_librarian.html', context)

## create, delete, and update author
class AuthorCreate(CreateView):
    model = Author
    fields = '__all__'
    initial = {'date_of_death': '05/01/2018'}

class AuthorUpdate(UpdateView):
    model = Author
    fields = ['first_name', 'last_name', 'date_of_birth', 'date_of_death']

class AuthorDelete(DeleteView):
    model = Author
    success_url = reverse_lazy('authors')    
