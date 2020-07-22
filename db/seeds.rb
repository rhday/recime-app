#seed data goes here


Amaury = User.create(email: "amaury@amaury.com", name: "Amaury", image_url: "https://frostedpetticoatblog.com/wp-content/uploads/2017/07/Amaury-Guichon.jpg", bio: "I am the king of pastry!", password: "pw")

Cedric = User.create(email: "cedric@cedric.com", name: "Cedric", image_url: "https://d3h1lg3ksw6i6b.cloudfront.net/media/image/2018/03/19/93fde61523514cf89dcdb367e012b90e_image1.jpeg", bio: "I am the Grandmaster of pastry!", password: "pw")

Post.create(title: "Guilty Pleasure Pâte à choux.", image_url: "https://www.sogoodmagazine.com/wp-content/uploads/2018/04/guilty-pleasure-amaury-guichon.jpg", description: "Guilty pleasure: red craquelin, pâte à choux, candied strawberry, raspberry pastry cream, mascarpone whip.", user_id: Amaury.id)
Post.create(title: "The Apple with dill.", image_url: "https://i.pinimg.com/564x/9d/61/64/9d6164809b10a5a9748061829c3a2726.jpg", description: "Changing the game: Apple and Dill used like you have never seen before!", user_id: Cedric.id)
