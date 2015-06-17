$(document).ready(function() {
  $('[data-book-code]').each(function() {
    var bookBox = $(this);
    var isbn = $(this).data('book-code');
    if (isbn) {
      var url = 'https://catalogue.bookrepublic.it/books/' + isbn;
      $.get(url, {
        dataType: 'json',
      }).done(function(data) {
        var book = data.linked.filter(function(elem) { return elem.type === 'book'; })[0];
        var author = data.linked.filter(function(elem) { return elem.type === 'author'; })[0];
        var imageUrl = 'http://alessandria.bookrepublic.it/api/books/' + isbn + '/cover?size=189x0';
        var bookUrl = 'https://libreriecoop.bookrepublic.it/libri/' + book.slug;
        var a = $("<a href='" + bookUrl +"' target='_blank'> Acquista </a>");
        if (book.current_price === 0) {
          var price = "Gratis!";
        } else {
          var price = (book.current_price / 100) + " €";
        }

        bookBox.find('.featured-book__format').html(book.format);
        bookBox.find('.featured-book__title').html(book.title);
        bookBox.find('.featured-book__author').html(author.name);
        bookBox.find('.book-excerpt__cover img').attr('src', imageUrl);
        bookBox.find('.featured-book__price').html(price);
        bookBox.find('.featured-book__button').html(a);
      });
    }
  });
});
