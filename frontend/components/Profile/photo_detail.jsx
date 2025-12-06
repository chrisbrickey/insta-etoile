import React from 'react';
import { Link, withRouter } from 'react-router-dom';
import merge from 'lodash/merge';
import Modal from 'react-modal';
import {hashHistory} from 'react-router';

class PhotoDetail extends React.Component {
  constructor(props) {
    super(props);

    let theId;
    if (this.props.currentPhoto) {
      theId = this.props.currentPhoto.id;
    } else {
      theId = null;
    }

    this.state = {
      modalOpen: false,
      photo: {
        caption: "",
        location: "",
        id: theId,
      }
    };

    this.closeModal = this.closeModal.bind(this);
    this.editPhoto = this.editPhoto.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    window.globalPhotoModal = this.globalPhotoModal.bind(this);
    this.destroyMe = this.destroyMe.bind(this);
  }

  componentDidMount() {
      this.props.fetchAllPhotos();
    }

  componentDidUpdate(prevProps, prevState) {
    // Update state when currentPhoto ID changes
    if (this.props.currentPhoto &&
        prevProps.currentPhoto?.id !== this.props.currentPhoto.id) {
      this.setState({
        photo: {
          id: this.props.currentPhoto.id,
          caption: this.props.currentPhoto.caption,
          location: this.props.currentPhoto.location
        }
      });
    }

    // Update state when modal opens
    if (this.props.currentPhoto &&
        Object.keys(this.props.currentPhoto).length &&
        !prevState.modalOpen &&
        this.state.modalOpen) {
      this.setState({
        photo: {
          ...this.state.photo,
          caption: this.props.currentPhoto.caption,
          location: this.props.currentPhoto.location
        }
      });
    }
  }

  globalPhotoModal () {
    this.props.fetchSinglePhoto(this.props.currentPhotoId);
    this.setState({ modalOpen: !this.state.modalOpen });
  }

  closeModal() {
    this.setState({ modalOpen: false });
  }

  destroyMe(event) {
    this.props.destroyPhoto(this.props.currentPhoto)
    .then(
      ( () => {
        this.setState({ photo: { caption: "", location: ""} });
      })
    );

  }

  capitalize(string) {
    let newString = "";
    let oldArray = string.split("");
    oldArray.forEach( (el) => {
      newString += el.toUpperCase();
    });

    return newString;
  }

  editPhoto(event) {
    const newPhoto = merge({}, this.state);
    newPhoto.photo[event.target.name] = event.target.value;
    this.setState(newPhoto);
  }

  handleSubmit(event) {
    event.preventDefault();
    this.closeModal();

    this.props.updatePhoto(this.state.photo)
      .then(
        ( () => {
          this.setState({ photo: { caption: "", location: ""} });
        })
      );

  }


  render() {

    if (this.state.modalOpen && this.props.currentPhoto) {

      let likesWord;
      if (this.props.currentPhoto.likesCount === 1) {
        likesWord = "like";
      } else {
        likesWord = "likes";
      }

      return (

          <main className="photo-modal-outer">
              <main className="photo-modal-inner">

                  <button>
                      <img
                          src="https://res.cloudinary.com/dckkkjkuz/image/upload/v1501126203/forbidden-mark_l01ir1.png"
                          alt="close mark"
                          className="closeMark"
                          onClick={this.closeModal}/>
                  </button>

                  <div className="duo-container">


                      <div className="picture-box">
                          <img
                              src={this.props.currentPhoto.photoUrl}
                              alt="photo"
                              className="actualPhoto"/>
                      </div>


                      <div className="detail-container">



                          <div className="feedItem-container2">
                              <div className="info-top2">

                                  <div className="thumbnailPic-container2">
                                      <img
                                          src={this.props.currentPhoto.profileImgUrl}
                                          alt="photo"
                                      />
                                  </div>

                                  <div id="info-username2">{this.props.currentPhoto.username}</div>
                                  </div>


                                  <form className="edit-form">

                                    <label>
                                        <input
                                            type="text"
                                            placeholder="add location"
                                            name="location"
                                            value={this.state.photo.location}
                                            onChange={this.editPhoto}
                                            className="edit-input"
                                        />
                                    </label>

                                    <label>
                                        <input
                                          type="text"
                                          placeholder="add caption"
                                          name="caption"
                                          value={this.state.photo.caption}
                                          onChange={this.editPhoto}
                                          className="edit-input"
                                        />
                                    </label>

                                      <button
                                        onClick={this.handleSubmit}
                                        type="submit"
                                        value="Submit"
                                        className="edit-submit">
                                        Submit Changes
                                      </button>

                                      <button
                                          onClick={this.destroyMe}
                                          className="deleteButton2">
                                          Delete Photo
                                      </button>
                                  </form>

                              </div>


                              <div className="info-middle"></div>


                              <div id="line2"></div>


                              <div className="likes-show-container">
                                  <div className="likesNumber">
                                      {this.props.currentPhoto.likesCount}
                                  </div>
                                  <div className="spacer"></div>
                                  <div className="likesText">
                                      {likesWord}
                                  </div>
                              </div>


                              <div id="line2"></div>


                              <div id="info-uploadDate2">
                                  {this.capitalize(this.props.currentPhoto.uploadDate)} AGO
                              </div>

                              </div>





                </div>
          </main>
      </main>


      );
    } else {
      return (<div></div>);
    }


  }


}

export default PhotoDetail;
