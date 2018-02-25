import React from 'react';
import { Link, withRouter } from 'react-router-dom';
import merge from 'lodash/merge';


class TheHeader extends React.Component {
  constructor(props) {
    super(props);
  }


  render() {

    return (

      <section className="header-container">
        <div className="navLinks-header">

            <div className="left-header">
                <Link className="profile-link" to={`/`}>
                    <img
                        src={'https://res.cloudinary.com/dckkkjkuz/image/upload/v1503432974/instagram-logo-grey_g4rmfr.png'}
                        alt="camera icon"
                        className="camera-icon"
                    />
                </Link>

                <div className="vertical-line"></div>

                  <Link className="profile-link" to={`/`}>
                      <img
                          src={'https://res.cloudinary.com/dckkkjkuz/image/upload/v1503431792/billabong_font_crop1_xhjdzw.png'}
                          alt="insta-étoile logo"
                          className="header-logo"
                      />
                  </Link>

            </div>


            <div className="right-header">

                <Link className="profile-link" to="/upload">
                    <img
                        src={'https://res.cloudinary.com/dckkkjkuz/image/upload/v1500855174/001-cloud-computing_gjhr1n.png'}
                        alt="upload"
                        className="upload-icon"
                    />
                </Link>

                <Link className="profile-link" to="/follow">
                    <img
                        src={'https://res.cloudinary.com/dckkkjkuz/image/upload/v1500614263/heart_sqbqyf.svg'}
                        alt="follow users"
                        className="header-icons"
                    />
                </Link>


              <Link className="profile-link" to={`users/${this.props.userId}`}>
                  <img
                      src={'https://res.cloudinary.com/dckkkjkuz/image/upload/v1500614263/user_nu2dc8.svg'}
                      alt="my profile"
                      className="header-icons"
                  />
              </Link>


            </div>

        </div>
      </section>
    );

  }


}

export default TheHeader;
