import React, { useState } from 'react';

const Mongo = ({content}) => {
  const [show, setShow] = useState(false);
  const handleShow = () => setShow(!show);

  return (
    <div className="detail">
      <div onClick={handleShow} className="syntax">{content.mongo_syntax}</div>
      {show ?
       <div>
       <h5><i className="fa fa-hand-o-right" aria-hidden="true"></i> Note</h5>
       <p>{content.mongo_note}</p>
       <h5><i className="fa fa-hand-o-right" aria-hidden="true"></i> Example</h5>
       <p style={{"font-family": "Verdana, Geneva, Tahoma, sans-serif"}}>{content.mongo_example}</p>
       <br />
       </div>
      : null }
    </div>
  );

};

export default Mongo;