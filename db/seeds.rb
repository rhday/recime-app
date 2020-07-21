#seed data goes here


Amaury = User.create(email: "amaury@amaury.com", image_url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Ffrostedpetticoatblog.com%2F2017%2F07%2Fpastry-magician-amaury-guichon%2F&psig=AOvVaw0McMjxsSz53jEwFN_1p6oa&ust=1595409069414000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCIj-qpeA3uoCFQAAAAAdAAAAABAP", bio: "I am the king of pastry!", password: "pw")

Cedric = User.create(email: "cedric@cedric.com", image_url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fguide.michelin.com%2Fen%2Farticle%2Fpeople%2Fcedric-grolet-Le-Meurice-sg&psig=AOvVaw17jUEKNWBeBY7qQZxu4G_I&ust=1595409757667000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCPiC8NKC3uoCFQAAAAAdAAAAABAD", bio: "I am the Grandmaster of pastry!", password: "pw")

Post.create(title: "Guilty Pleasure Pâte à choux.", image_url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.sogoodmagazine.com%2Fpastry-recipes%2Fguilty-pleasure-pate-a-choux-by-amaury-guichon%2F&psig=AOvVaw0McMjxsSz53jEwFN_1p6oa&ust=1595409069414000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCIj-qpeA3uoCFQAAAAAdAAAAABAD", description: "Guilty pleasure: red craquelin, pâte à choux, candied strawberry, raspberry pastry cream, mascarpone whip.", user_id: Amaury.id)
Post.create(title:, image_url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F848224911045180057%2F&psig=AOvVaw17jUEKNWBeBY7qQZxu4G_I&ust=1595409757667000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCPiC8NKC3uoCFQAAAAAdAAAAABAI", description: " Changing the game: Apple and Dill used like you have never seen before!", user_id: Cedric.id)
