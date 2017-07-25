import React from 'react';
import { Link, withRouter } from 'react-router-dom';
import merge from 'lodash/merge';

import FooterXXX from '../Navigation/footer';
import HeaderXXX from '../Navigation/header';
import Dropzone from './dropzone';


console.log("on the upload.jsx");

class Upload extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      photo: {
        caption: "",
        location: "",
        photoUrl: ""
      },
    };

    //this.anyMethod = this.anyMethod.bind(this);
    // this.cropPhoto = this.cropPhoto.bind(this);
    this.postPhoto = this.postPhoto.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updatePhoto = this.updatePhoto.bind(this);
  }


  componentDidMount() {
      this.props.fetchAllPhotos();
    }

  // cropPhoto(photoUrl) {
  //   const cropText = "/upload/c_thumb,w_600/";
  //   // const cropText = "/upload/c_thumb,h_500,w_500/";
  //   const photoUrlArray = photoUrl.split("/upload/");
  //   const croppedUrl = photoUrlArray[0] + cropText + photoUrlArray[1];
  //
  //   return croppedUrl;
  // }


  updatePhoto(event) {
    const newPhoto = merge({}, this.state);
    newPhoto.photo[event.target.name] = event.target.value;
    this.setState(newPhoto);
  }


  //receives photoUrl as argument and adds photo to db on backend AND shows this photo on the front end (so user an edit)
  postPhoto(photoUrl) {
    console.log("inside postPhoto on upload.jsx");
    let newPhoto = {photo_url: photoUrl};
    console.log(newPhoto);
    this.props.createPhoto({photo: newPhoto});

    //replacing this ajax with asynchronous call above which includes ajax call
    // $.ajax({
    //   method: 'POST',
    //   url: '/api/photos',
    //   data: {photo: newPhoto}

      //below adds newPhoto to frontend AFTER it comes back from backend, but app already does this via fetchAllPhotos
      // success: ((newPhotoFromBackend) => {
      //   var photos = this.state.photos.byId;
      //   photos.newPhotoFromBackend.id = newPhotoFromBackend;
      //   photos.currentPhoto = newPhotoFromBackend.id;
      //   this.setState({photos: photos});
      // })
    // });
  }

  handleSubmit(event) {
    console.log("inside handleSubmit on upload page");

    // let testUser = this.state.user;
    // console.log(testUser);
    // console.log({user: testUser});
    //
    // event.preventDefault();
    // let newUser = this.state.user;
    // this.props.processForm({ user: newUser })
    //   .then(
    //     (()=> {
    //       console.log("inside submit callback upon success");
    //       this.setState({ user: { name: "", username: "", password: ""}, errors: null});
    //     }),
    //
    //     (this.props.clearErrors())
    //   );


  }

  //remember that errors and other objects might be null so render conditionally
  render() {

    console.log("rendering on upload.jsx");
    console.log(this.props);

    return (
      <div className="upload-page-container">

          <HeaderXXX userId={this.props.currentUser.id}/>


          <section className="upload-sub-container">
              <div className="sub-sub-container">
                  <div className="upload-form-container">


                      <div className="option1-box">
                          <div className="optionText">Option 1: drag/drop or select file here</div>

                          <div className="cloudinary-container">
                            <Dropzone postPhoto={this.postPhoto}/>
                          </div>
                      </div>


                      <div className="option2-box">

                          <div className="optionText">Option 2: enter information manually</div>

                          <div className="option2-form-container">
                              <form onSubmit={this.handleSubmit} id="upload-form">

                                  <label>
                                      <input
                                        type="text"
                                        placeholder="caption (optional)"
                                        name="caption"
                                        value={this.state.photo.caption}
                                        onChange={this.updatePhoto}
                                        className="upload-input"
                                      />
                                  </label>
                                  <br/>

                                  <label>
                                      <input
                                          type="text"
                                          placeholder="location (optional)"
                                          name="location"
                                          value={this.state.photo.location}
                                          onChange={this.updatePhoto}
                                          className="upload-input"
                                      />
                                  </label>
                                  <br/>

                                    <label>
                                        <input
                                            type="text"
                                            placeholder="photo's url (required)"
                                            name="photoUrl"
                                            value={this.state.photo.location}
                                            onChange={this.updatePhoto}
                                            className="upload-input"
                                        />
                                    </label>
                                  <br/>

                                  <input
                                      type="submit"
                                      value="Submit"
                                      className="auth-button"
                                      id="tied-to-form"
                                  />

                              </form>
                          </div>


                      </div>


                  </div>
              </div>
          </section>


          <FooterXXX/>

      </div>
    );

  }


}

export default Upload;
// export default withRouter(Upload);
