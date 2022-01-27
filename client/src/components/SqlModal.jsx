// use sampleDemo[1].sqlQuery
import React, {useState} from 'react';
import sampleDemo from '../../../server/database/sampleDemo.js';

const SqlModal = () => {
  const [show, setShow] = useState(false);
  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);

  return (
    <div>
      <button className="sqlButton" onClick={handleShow}>SQL demo</button>
      {show ?
      (
        <div className="modalContainer">
          <div className="modal">
            <h3>{sampleDemo[2]}</h3>
            <p className="content">{sampleDemo[3]}</p>
            <button className="closeButton" onClick={handleClose}>Close</button>
          </div>
        </div>

      ) : null}
    </div>
  )

};

export default SqlModal;