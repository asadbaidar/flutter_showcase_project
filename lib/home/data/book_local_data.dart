part of 'data.dart';

class BookLocalClient implements BookDataClient {
  BookLocalClient();

  @override
  Future<List<BookEntity>> getBooks() async {
    final json = _data.toJsonArray();
    return $mapList(
      json,
      (dynamic e) => BookEntity.fromJson(e as JsonObject),
    )!;
  }
}

const _data = '''
[
  {
    "title": "The Hobbit",
    "author": "J. R. R. Tolkien",
    "date": "21 Sep 1937",
    "cover": "https://picsum.photos/seed/1/480/640",
    "isNew": true
  },
  {
    "title": "The Lord of the Rings",
    "author": "J. R. R. Tolkien",
    "date": "29 Jul 1954",
    "cover": "https://picsum.photos/seed/2/480/640",
    "isNew": true
  },
  {
    "title": "The Silmarillion",
    "author": "J. R. R. Tolkien",
    "date": "15 Sep 1977",
    "cover": "https://picsum.photos/seed/3/480/640",
    "isNew": true
  },
  {
    "title": "The Children of Húrin",
    "author": "J. R. R. Tolkien",
    "date": "17 Apr 2007",
    "cover": "https://picsum.photos/seed/4/480/640",
    "isNew": true
  },
  {
    "title": "The Fall of Gondolin",
    "author": "J. R. R. Tolkien",
    "date": "30 Aug 2018",
    "cover": "https://picsum.photos/seed/5/480/640",
    "isNew": true
  },
  {
    "title": "Unfinished Tales",
    "author": "J. R. R. Tolkien",
    "date": "02 Sep 1980",
    "cover": "https://picsum.photos/seed/6/480/640",
    "isNew": false
  },
  {
    "title": "The Book of Lost Tales",
    "author": "J. R. R. Tolkien",
    "date": "01 Jan 1983",
    "cover": "https://picsum.photos/seed/7/480/640",
    "isNew": false
  },
  {
    "title": "The Lays of Beleriand",
    "author": "J. R. R. Tolkien",
    "date": "01 Jan 1985",
    "cover": "https://picsum.photos/seed/8/480/640",
    "isNew": false
  },
  {
    "title": "The Shaping of Middle-earth",
    "author": "J. R. R. Tolkien",
    "date": "01 Jan 1986",
    "cover": "https://picsum.photos/seed/9/480/640",
    "isNew": false
  },
  {
    "title": "The Lost Road and Other Writings",
    "author": "J. R. R. Tolkien",
    "date": "01 Jan 1987",
    "cover": "https://picsum.photos/seed/10/480/640",
    "isNew": false
  },
  {
    "title": "Harry Potter and the Philosopher's Stone",
    "author": "J. K. Rowling",
    "date": "26 Jun 1997",
    "cover": "https://picsum.photos/seed/11/480/640",
    "isNew": true
  },
  {
    "title": "Harry Potter and the Chamber of Secrets",
    "author": "J. K. Rowling",
    "date": "02 Jul 1998",
    "cover": "https://picsum.photos/seed/12/480/640",
    "isNew": true
  },
  {
    "title": "Harry Potter and the Prisoner of Azkaban",
    "author": "J. K. Rowling",
    "date": "08 Jul 1999",
    "cover": "https://picsum.photos/seed/13/480/640",
    "isNew": true
  },
  {
    "title": "Harry Potter and the Goblet of Fire",
    "author": "J. K. Rowling",
    "date": "08 Jul 2000",
    "cover": "https://picsum.photos/seed/14/480/640",
    "isNew": true
  },
  {
    "title": "Harry Potter and the Order of the Phoenix",
    "author": "J. K. Rowling",
    "date": "21 Jun 2003",
    "cover": "https://picsum.photos/seed/15/480/640",
    "isNew": true
  },
  {
    "title": "Harry Potter and the Half-Blood Prince",
    "author": "J. K. Rowling",
    "date": "16 Jul 2005",
    "cover": "https://picsum.photos/seed/16/480/640",
    "isNew": false
  },
  {
    "title": "Harry Potter and the Deathly Hallows",
    "author": "J. K. Rowling",
    "date": "21 Jul 2007",
    "cover": "https://picsum.photos/seed/17/480/640",
    "isNew": false
  },
  {
    "title": "The Tales of Beedle the Bard",
    "author": "J. K. Rowling",
    "date": "04 Dec 2008",
    "cover": "https://picsum.photos/seed/18/480/640",
    "isNew": false
  },
  {
    "title": "Quidditch Through the Ages",
    "author": "J. K. Rowling",
    "date": "01 Mar 2001",
    "cover": "https://picsum.photos/seed/19/480/640",
    "isNew": false
  },
  {
    "title": "Fantastic Beasts and Where to Find Them",
    "author": "J. K. Rowling",
    "date": "01 Mar 2001",
    "cover": "https://picsum.photos/seed/20/480/640",
    "isNew": false
  }
]
''';
