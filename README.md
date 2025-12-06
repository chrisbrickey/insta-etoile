# insta-étoile

[insta-étoile](www.insta-étoile.com) is a full-stack web app. Through reverse-engineering, I attempted to mimic the functionality, look, and feel of Instagram.

## Background
Danseuse/Danseur Étoile (literally 'star dancer' in French) is the highest rank within the Paris Opera Ballet. 
insta-étoile provides a visual platform to enable performing artists of all kinds to instantly share and showcase photos of their craft while building a community of supporters and followers.

## Features Highlight

#### Detail View with Edit
A graceful modal overlays each users profile page when one of their images is selected.  It shows details of the post and allows the creator of a post to edit the details with instant update across the application.

![Detail](https://res.cloudinary.com/dckkkjkuz/image/upload/v1501280102/view_edit_cxeurx.png)

#### Likes & Comments
The Like button toggles to indicate whether the current user has or has not liked a particular post and the sum total likes for each post updates live.  Comments can be added on-the-spot by simply typing and returning. They are instantly viewable by all users.  Post and delete buttons are also made available to the user for further guidance and ease-of-use.  Likes and comments are protected such that only the user initiating either a like or comment can reverse/delete it.

![Likes_Comments](https://res.cloudinary.com/dckkkjkuz/image/upload/v1501280092/likes_comments_jtghyt.png)

#### Drag & Drop Upload
Users can upload with ease with drag/drop functionality.  They can also double-click in the same spot if they prefer to select a file from their directories.

![Upload](https://res.cloudinary.com/dckkkjkuz/image/upload/v1501282875/drag_drop_ilad0m.png)

#### Secure Authentication
Users are greeted with an intuitive login page that guides them to successful login with informative and friendly error messages.

![Login](https://res.cloudinary.com/dckkkjkuz/image/upload/v1501280097/login_gt0iav.png)


## Technology

insta-étoile is a single-page web application that utilizes a Rails5 backend and React/Redux frontend with various dependencies.

- [Frontend technology][frontend]
- [Backend technology][backend]

[frontend]: docs/frontend.md
[backend]: docs/backend.md


## Project Design

- [View Wireframes][wireframes]
- [React Components][components]
- [API endpoints][api-endpoints]
- [DB schema][schema]
- [Sample State][sample-state]

[READMEdev]: docs/READMEdev.md
[wireframes]: docs/wireframes
[components]: docs/component-hierarchy.md
[sample-state]: docs/sample-state.md
[api-endpoints]: docs/api-endpoints.md
[schema]: docs/schema.md


## Local Development
1. Set up Ruby 3.3.6 using rbenv
   - Check if Ruby 3.3.6 is already installed: `rbenv versions`
   - If not listed, install it: `rbenv install 3.3.6`
   - The `.ruby-version` file will automatically activate 3.3.6 when you're in this directory
   - Verify the correct version is active: `ruby --version` (should show 3.3.6)

2. Install ruby gems 
```
bundle install
```
_NB: If you change Ruby versions, you must re-run `bundle install` to reinstall gems with the new Ruby version._

3. Install node modules
```
npm install
```

4. In one terminal window, run the rails server
```
bundle exec rails server
```

5. In a second terminal window, run webpack to manage frontend assets
```
npx webpack --watch
```

6. In a third terminal window, activate hot reload to make development more efficient
```
guard
```

To reset the database (drop, create, migrate, and seed in one command):
```
bundle exec rails db:reset
```

## Future Development

#### Video Play
Performing artists will be able to upload and share videos of rehearsals and performances.

#### Robust User Profiles
Performing artists will be able to synthesize and showcase their experience and talent in a full page profile.  They can share their career journey with pictures and videos accompanied by supporting text. The user profile template will allow for some curation but will maintain a consistent structure that is easy for others to absorb.

#### Explore & Follow
Casting staff and the broader community will be able to search and follow performing artists.  A user's photo feed will consists only of posts from artists that they are following.  Users will be able to search for performing artists based on content of their posts and profiles.