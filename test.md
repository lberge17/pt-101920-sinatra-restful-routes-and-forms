RESTFUL ROUTES
books

get | /books | index | READ
post | /books | [redirect /books/:id?] | CREATE
get | /books/new | new (form) | CREATE
patch | /books/:id | [redirect /books/:id?] | UPDATE
get | /books/:id | show | READ
delete | /books/:id | [redirect /books?] | DELETE
get | /books/:id/edit | edit (form) | UPDATE