import React, {useState} from 'react';
import sampleDemo from '../../../server/database/sampleDemo.js';

const MongoModal = () => {
  const [show, setShow] = useState(false);
  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);

  return (
    <div>
      <button className="mongoButton" onClick={handleShow}>MongoDB demo</button>
      {show ?
      (
        <div className="modalContainer">
          <div className="modal">
            <h3>{sampleDemo[0]}</h3>
            <p className="content">{sampleDemo[1]}</p>
            <button className="closeButton" onClick={handleClose}>Close</button>
          </div>
        </div>

      ) : null}
    </div>
  )

};

export default MongoModal;