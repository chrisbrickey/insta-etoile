import { ajaxFetchComment,
         ajaxCreateComment,
         ajaxDestroyComment } from "../util/comment_api_util";


export const RECEIVE_COMMENT = 'RECEIVE_COMMENT';
export const REMOVE_COMMENT = 'REMOVE_COMMENT';


//synchronous action creators

export const receiveComment = comment => {
  console.log("inside sync receiveComment");
  console.log(comment);


  return({
    type: RECEIVE_COMMENT,
    comment
  });
};

//server is looking for comment key and not finding it
export const removeComment = comment => {
  console.log("inside sync removeComment");
  console.log(comment);

  return({
    type: REMOVE_COMMENT,
    comment
  });
};



//asynchronous action creators

//when fetching...you need to access the key .responseJSON....it has all the keys including username!!!
export const fetchComment = (id) => dispatch => {
  console.log("in async fetchComment");
  console.log(id);

  return ajaxFetchComment(id)
    .then( returnedComment => (dispatch(receiveComment(returnedComment)))
  );
};


export const createComment = (comment) => dispatch => {
  console.log("in async createComment");

  return ajaxCreateComment(comment)
    .then( returnedComment => (dispatch(receiveComment(returnedComment)))
  );
};


export const destroyComment = (id) => dispatch => {
  console.log("in async destroyComment");

  return ajaxDestroyComment(id)
    .then( commentItDeleted => (dispatch(removeComment(commentItDeleted)))
  );
};
