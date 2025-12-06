# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#no seeds leftover from previous builds
User.destroy_all
Photo.destroy_all
Like.destroy_all
Comment.destroy_all

#will rollback all seeds if any issues; create! fails loudly so can get more information on errors
ActiveRecord::Base.transaction do
  demo1 = User.create!(name: 'Chris Brickey', username: 'chrisbrickey', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1501138321/headshot_crop4_cjy4sm.jpg', tagline: 'always be dancing | www.chrisbrickey.com')
  demo2 = User.create!(name: 'Hazel Buell', username: 'breakaleg', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: 'Technical perfection is insufficient. It is an orphan without the true soul of a dancer. - Sylvie Guillem')
  demo3 = User.create!(name: 'Steve Clark', username: 'twototango', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1503460927/abstract_o0yek5.jpg', tagline: 'Be strong, be fearless, be beautiful. - Misty Copeland')
  demo4 = User.create!(name: 'Todd Lutes', username: 'flipitandreverseit', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: 'I only try to dance better than myself. - Mikhail Baryshnikov')
  demo5 = User.create!(name: 'Daria Vaca', username: 'attitude', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1503460942/sneaker_ilnzay.jpg', tagline: 'Work transforms talent into genius. - Anna Pavlova')

  otheruser1 = User.create!(name: 'Amélie Dubois', username: 'amelie_dubois', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: "I'm good at computers")
  otheruser2 = User.create!(name: 'Camille Laurent', username: 'camille_laurent', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: "I'm good at computers")
  otheruser3 = User.create!(name: 'Sophie Martin', username: 'sophie_martin', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: "I'm good at computers")
  otheruser4 = User.create!(name: 'Claire Rousseau', username: 'claire_rousseau', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: "I'm good at computers")
  otheruser5 = User.create!(name: 'Juliette Moreau', username: 'juliette_moreau', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: "I'm good at computers")
  otheruser6 = User.create!(name: 'Léa Bernard', username: 'lea_bernard', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: "I'm good at computers")
  otheruser7 = User.create!(name: 'Emma Petit', username: 'emma_petit', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: "I'm good at computers")
  otheruser8 = User.create!(name: 'Chloé Durand', username: 'chloe_durand', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: "I'm good at computers")
  otheruser9 = User.create!(name: 'Marie Lefebvre', username: 'marie_lefebvre', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: "I'm good at computers")
  otheruser10 = User.create!(name: 'Manon Garcia', username: 'manon_garcia', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: "I'm good at computers")
  otheruser11 = User.create!(name: 'Lucas Bonnet', username: 'lucas_bonnet', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: "I'm good at computers")
  otheruser12 = User.create!(name: 'Antoine Fournier', username: 'antoine_fournier', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: "I'm good at computers")
  otheruser13 = User.create!(name: 'Mathieu Girard', username: 'mathieu_girard', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: "I'm good at computers")
  otheruser14 = User.create!(name: 'Pierre Roux', username: 'pierre_roux', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: "I'm good at computers")
  otheruser15 = User.create!(name: 'Thomas Blanc', username: 'thomas_blanc', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: "I'm good at computers")
  otheruser16 = User.create!(name: 'Nicolas Fabre', username: 'nicolas_fabre', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: "I'm good at computers")
  otheruser17 = User.create!(name: 'Julien Vincent', username: 'julien_vincent', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: "I'm good at computers")
  otheruser18 = User.create!(name: 'Alexandre Meyer', username: 'alexandre_meyer', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: "I'm good at computers")
  otheruser19 = User.create!(name: 'Maxime Perrin', username: 'maxime_perrin', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: "I'm good at computers")
  otheruser20 = User.create!(name: 'Hugo Simon', username: 'hugo_simon', password: '123456', profile_img_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/c_scale,w_590/v1500953840/instagram-color-fade_pvpssi.png', tagline: "I'm good at computers")



  photo23 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1501092784/ftbnu6b6jw4qonu1hqrd.jpg',
    caption: '',
    location: 'beach',
    author_id: demo3.id
    )



  photo22 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1501086228/hw6ozj3mdelhn5wpsn2x.jpg',
    caption: 'sway',
    location: '',
    author_id: demo2.id
    )

  photo21 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1501053343/backbend_vh5ltl.jpg',
    caption: 'flexing',
    location: '',
    author_id: demo1.id
    )

  photo20 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1501053244/golden_vxtdsu.jpg',
    caption: 'golden',
    location: '',
    author_id: demo5.id
    )



  photo19 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1501140295/ff8f850aaa3e2a69f32b55430c6de8a8_bhibsr.jpg',
    caption: 'stretch',
    location: '',
    author_id: demo4.id
    )

  photo18 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1501053595/swan_lake_inls3n.jpg',
    caption: '',
    location: 'on swan lake',
    author_id: demo3.id
    )

  photo17 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1500771579/dark_red_l5qojp.jpg',
    caption: 'superhero',
    location: '',
    author_id: demo2.id
    )

  photo16 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1501053260/leap_z9x4xf.jpg',
    caption: 'momentum',
    location: '',
    author_id: demo1.id
    )

  photo15 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1500771428/coral_nvemtt.jpg',
    caption: 'shape',
    location: '',
    author_id: demo5.id
    )



  photo14 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1501257012/wallpaperStudio_smaller_scnd7x.png',
    caption: 'love the view',
    location: 'the studio',
    author_id: demo4.id
    )

  photo13 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1500771443/trio_wfx6xb.jpg',
    caption: 'trio',
    location: '',
    author_id: demo3.id
    )

  photo12 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1500771634/sunset_oqve3y.jpg',
    caption: 'grande sunset',
    location: '',
    author_id: demo2.id
    )

  photo11 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1500933186/fif8afswdavqfxnwomtu.jpg',
    caption: '',
    location: '',
    author_id: demo1.id
    )

  photo10 = Photo.create!(
    photo_url: ' https://res.cloudinary.com/dckkkjkuz/image/upload/v1501140409/male3_tljxqb.jpg',
    caption: 'wind up',
    location: '',
    author_id: demo5.id
    )



  photo9 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1501140370/d4d1f242a23027cf871a355974e9a079_jk55ia.jpg',
    caption: 'magenta',
    location: '',
    author_id: demo4.id
    )

  photo8 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1501070203/rxoiqsrwolgmdfxkmjro.jpg',
    caption: 'in motion',
    location: '',
    author_id: demo3.id
    )

  photo7 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1500771455/shadows_r0laa1.jpg',
    caption: 'long shadows',
    location: '',
    author_id: demo2.id
    )

  photo6 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1501054164/couple_izifdx.jpg',
    caption: 'love',
    location: '',
    author_id: demo1.id
    )


  photo5 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1501138480/coat-sml_yrydyv.png',
    caption: 'en l\'air',
    location: '',
    author_id: demo5.id
    )



  photo4 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1501053292/silouette_q78lo5.jpg',
    caption: 'profile',
    location: 'on stage',
    author_id: demo4.id
    )

  photo3 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1501257022/mural_smaller_rsvfhf.png',
    caption: 'urban inspiration',
    location: '',
    author_id: demo3.id
    )

  photo2 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1500771420/infinity_neg30m.jpg',
    caption: 'infinitely beautiful',
    location: '',
    author_id: demo2.id
    )

  photo1 = Photo.create!(
    photo_url: 'https://res.cloudinary.com/dckkkjkuz/image/upload/v1500771271/fierce_xyjq3a.jpg',
    caption: 'en pointe',
    location: '',
    author_id: demo1.id
    )


  like1 = Like.create!(user_id: demo5.id, likable_id: photo1.id, likable_type: 'Photo')
  like2 = Like.create!(user_id: demo5.id, likable_id: photo2.id, likable_type: 'Photo')
  like3 = Like.create!(user_id: demo5.id, likable_id: photo3.id, likable_type: 'Photo')
  like4 = Like.create!(user_id: demo5.id, likable_id: photo4.id, likable_type: 'Photo')
  like5 = Like.create!(user_id: demo5.id, likable_id: photo5.id, likable_type: 'Photo')
  like6 = Like.create!(user_id: demo5.id, likable_id: photo6.id, likable_type: 'Photo')
  like7 = Like.create!(user_id: demo5.id, likable_id: photo8.id, likable_type: 'Photo')
  like8 = Like.create!(user_id: demo5.id, likable_id: photo10.id, likable_type: 'Photo')
  like9 = Like.create!(user_id: demo5.id, likable_id: photo12.id, likable_type: 'Photo')
  like10 = Like.create!(user_id: demo5.id, likable_id: photo14.id, likable_type: 'Photo')

  like11 = Like.create!(user_id: demo4.id, likable_id: photo1.id, likable_type: 'Photo')
  like12 = Like.create!(user_id: demo4.id, likable_id: photo2.id, likable_type: 'Photo')
  like13 = Like.create!(user_id: demo4.id, likable_id: photo3.id, likable_type: 'Photo')
  like14 = Like.create!(user_id: demo4.id, likable_id: photo4.id, likable_type: 'Photo')
  like15 = Like.create!(user_id: demo4.id, likable_id: photo5.id, likable_type: 'Photo')
  like16 = Like.create!(user_id: demo4.id, likable_id: photo6.id, likable_type: 'Photo')
  like17 = Like.create!(user_id: demo4.id, likable_id: photo9.id, likable_type: 'Photo')
  like18 = Like.create!(user_id: demo4.id, likable_id: photo12.id, likable_type: 'Photo')
  like19 = Like.create!(user_id: demo4.id, likable_id: photo15.id, likable_type: 'Photo')
  like20 = Like.create!(user_id: demo4.id, likable_id: photo18.id, likable_type: 'Photo')

  like21 = Like.create!(user_id: demo3.id, likable_id: photo1.id, likable_type: 'Photo')
  like22 = Like.create!(user_id: demo3.id, likable_id: photo3.id, likable_type: 'Photo')
  like23 = Like.create!(user_id: demo3.id, likable_id: photo5.id, likable_type: 'Photo')
  like24 = Like.create!(user_id: demo3.id, likable_id: photo7.id, likable_type: 'Photo')
  like25 = Like.create!(user_id: demo3.id, likable_id: photo11.id, likable_type: 'Photo')
  like26 = Like.create!(user_id: demo3.id, likable_id: photo15.id, likable_type: 'Photo')
  like27 = Like.create!(user_id: demo3.id, likable_id: photo19.id, likable_type: 'Photo')
  like28 = Like.create!(user_id: demo3.id, likable_id: photo22.id, likable_type: 'Photo')
  like29 = Like.create!(user_id: demo3.id, likable_id: photo23.id, likable_type: 'Photo')
  like30 = Like.create!(user_id: demo3.id, likable_id: photo18.id, likable_type: 'Photo')

  like31 = Like.create!(user_id: demo2.id, likable_id: photo2.id, likable_type: 'Photo')
  like32 = Like.create!(user_id: demo2.id, likable_id: photo4.id, likable_type: 'Photo')
  like33 = Like.create!(user_id: demo2.id, likable_id: photo8.id, likable_type: 'Photo')
  like34 = Like.create!(user_id: demo2.id, likable_id: photo10.id, likable_type: 'Photo')
  like35 = Like.create!(user_id: demo2.id, likable_id: photo12.id, likable_type: 'Photo')
  like36 = Like.create!(user_id: demo2.id, likable_id: photo18.id, likable_type: 'Photo')
  like37 = Like.create!(user_id: demo2.id, likable_id: photo14.id, likable_type: 'Photo')
  like38 = Like.create!(user_id: demo2.id, likable_id: photo17.id, likable_type: 'Photo')
  like39 = Like.create!(user_id: demo2.id, likable_id: photo20.id, likable_type: 'Photo')
  like40 = Like.create!(user_id: demo2.id, likable_id: photo23.id, likable_type: 'Photo')

  like41 = Like.create!(user_id: demo1.id, likable_id: photo2.id, likable_type: 'Photo')
  like42 = Like.create!(user_id: demo1.id, likable_id: photo3.id, likable_type: 'Photo')
  like43 = Like.create!(user_id: demo1.id, likable_id: photo4.id, likable_type: 'Photo')
  like44 = Like.create!(user_id: demo1.id, likable_id: photo5.id, likable_type: 'Photo')
  like45 = Like.create!(user_id: demo1.id, likable_id: photo6.id, likable_type: 'Photo')
  like46 = Like.create!(user_id: demo1.id, likable_id: photo19.id, likable_type: 'Photo')
  like47 = Like.create!(user_id: demo1.id, likable_id: photo18.id, likable_type: 'Photo')
  like48 = Like.create!(user_id: demo1.id, likable_id: photo17.id, likable_type: 'Photo')
  like49 = Like.create!(user_id: demo1.id, likable_id: photo21.id, likable_type: 'Photo')
  like50 = Like.create!(user_id: demo1.id, likable_id: photo12.id, likable_type: 'Photo')



























end
