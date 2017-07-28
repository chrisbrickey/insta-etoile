import merge from 'lodash/merge';
import { RECEIVE_ALL_PHOTOS,
         RECEIVE_SINGLE_PHOTO,
         REMOVE_PHOTO } from '../actions/photo_actions';

import { RECEIVE_PHOTO_LIKE,
         REMOVE_PHOTO_LIKE } from '../actions/photo_like_actions';


const defaultState = Object.freeze({
  currentPhoto: null,
  byPopularity: [],
  byId: null
});

export const photoReducer = (state = defaultState, action) => {
  Object.freeze(state);
  let newState;


  switch(action.type) {

    case RECEIVE_ALL_PHOTOS:
        console.log("inside reducer at RECEIVE_ALL_PHOTOS");

        return merge({}, state, {
          byId: action.byId
        });

    case RECEIVE_SINGLE_PHOTO:
        console.log("inside reducer at RECEIVE_SINGLE_PHOTO");

        newState = merge({}, state);
        newState.currentPhoto = action.currentPhoto;
        newState.byId[action.currentPhoto] = action.byId[action.currentPhoto];
        return newState;

    case REMOVE_PHOTO:
        console.log("inside reducer at REMOVE_PHOTO");

        newState = merge({}, state);
        delete newState.byId[action.photo.id];
        newState.currentPhoto = null;
        return newState;




    case RECEIVE_PHOTO_LIKE:
      console.log("inside photo reducer at RECEIVE_PHOTO_LIKE");

      newState = merge({}, state);
      const photo = newState.byId[action.photoLike.likableId];
      photo.likesCount += 1;
      photo.usersWhoLike.push(action.photoLike.userId);
      photo.likedByCurrentUser = true;

      return newState;


    case REMOVE_PHOTO_LIKE:
      console.log("inside photo reducer at REMOVE_PHOTO_LIKE");

      newState = merge({}, state);
      const anotherPhoto = newState.byId[action.photoLike.likableId];
      anotherPhoto.likesCount -= 1;

      anotherPhoto.usersWhoLike.splice(anotherPhoto.usersWhoLike.indexOf(action.photoLike.userId), 1)

      anotherPhoto.usersWhoLike.push(action.photoLike.userId);

      anotherPhoto.likedByCurrentUser = false;

      return newState;


    default:
        return state;

  }
};
