import React, { Component } from 'react';
import './styles/App.css';
import {Timeline, TimelineEvent} from 'react-event-timeline'

// Component to render an individual family's button
// controlled component can be defined as a functional component
function House(props) {
  let className = 'btnHouse ';
  className += props.name + ' ';
  let imgPath = '/images/houses/' + props.name + '.png';
  return (
    <div>
      <button className={className} onClick={props.onClick}>
        {props.name}
      </button>
      <img className="imgSigil" alt={props.name} src={imgPath}/>
    </div>
  );
}

// Controlled component to render an individual character's button
function Character(props) {
  let className = 'btnCharacter ';
  className += 'house' + props.houseID + ' ';
  return (
    <button className={className} onClick={props.onClick}>
      {props.name}
    </button>
  );
}

// Controlled component to render a character's set of events
function Event(props) {
  return (
    <p className="Event">
      {props.description}
    </p>
  );
}

// Controlled component to render a back button to change App.state.mode
function BtnBack(props) {
  let target = '';
  if (props.mode === 'characters') {
    target = 'houses';
  } else if (props.mode === 'events') {
    target = 'characters';
  }
  return (
    <button className="btnBack" onClick={props.onClick}>
      Back to {target}
    </button>
  );
}

// Component to render the overall app
class App extends Component {
  constructor() {
    super();
    this.state = {
      houses: [],
      characters: [],
      events: [],
      mode: 'houses',
    };
  }

  componentDidMount() {
    fetch('/houses')
    .then(res => {
      console.log("React received a HOUSES response from Express: " + res);
      return res.json();
    })
    .then(houses => {
      console.log(houses);
      this.setState({ houses })
    });
  }

  handleBackClick(i, j) {
    if (this.state.mode === 'events') {
      this.setState( {mode: 'characters'} )
    } else if (this.state.mode === 'characters') {
      this.setState( {mode: 'houses'} )
    }
  }

  handleHouseClick(i, j) {
    console.log("Handling click for House " + i + "with HouseID " + j);
    this.setState( {mode: 'characters'} )
    fetch('/characters/' + JSON.stringify(j))
    .then(res => {
      console.log("React received a CHARACTERS response from Express: " + res);
      return res.json();
    })
    .then(characters => {
      console.log(characters);
      this.setState({ characters })
    });
  }

  handleCharClick(i, j) {
    console.log("Handling click for " + i + " with characterID " + j);
    this.setState( {mode: 'events'} )
    fetch('/events/' + JSON.stringify(j))
    .then(res => {
      console.log("React received an EVENTS response from Express: " + res);
      return res.json();
    })
    .then(events => {
      console.log(events);
      this.setState({ events })
    });
  }

  renderHouse(i, j) {
    return (
      <House
      name={i}
      onClick={() => this.handleHouseClick(i, j)}
      />
    );
  }

  renderCharacter(i, j, k) {
    return (
      <Character
      name={i}
      houseID={k}
      onClick={() => this.handleCharClick(i, j)}
      />
    );
  }

  renderEvent(i) {
    return (
      <Event
      description={i}
      />
    );
  }

  renderBtnBack(i) {
    return (
      <BtnBack
      mode={i}
      onClick={() => this.handleBackClick(i)}
      />
    );
  }

  render() {
    if (this.state.mode === 'houses') {
      return (
        <div className="App">
          <h1>Game of Thrones Events Timeline</h1>
          <div className="intro">
            <p>Game of Thrones Season 9 releases in April 2019, concluding 8 years of our immersion in George R. R. Martin's rich fantasy world. After nearly 2 years off the air, explore each character's timeline of events up to the end of season 7 to refresh your memory on what has happened up to now...</p>
            <p>Click a House to begin, then select your character. You can go up a level at any time with the back buttons at the top.</p>
          </div>
          <div className="intro" id="intro2">
            <p>N.B. The only character with data is Eddard Stark, in house Stark. All other characters will return test data. Please see report section 'Project Overview' for more details.</p>
          </div>
          <h2>Houses</h2>
          {this.state.houses.map(house =>
            // Just print a list <div key={house.HouseID}>{house.Name}</div>
            <div key={house.HouseID}>{this.renderHouse(house.Name, house.HouseID)}</div>
            )
          }
          <div className="footer">
            <img src="/images/assets/footer_background.svg" alt="footer background" preserveAspectRatio="none"/>
            <p id="footer_text">Site by Adam Matheson - 1757290 - Web Tech COMSM32500</p>
          </div>
        </div>
      );
    } else if (this.state.mode === 'characters') {
      return (
        <div className="App">
          <h1>Game of Thrones Events Timeline</h1>
          <h2>Characters</h2>
          <div>{this.renderBtnBack(this.state.mode)}</div>
          {this.state.characters.map(character =>
            <div key={character.CharacterID}>{this.renderCharacter(character.FirstName, character.CharacterID, character.HouseID)}</div>
            )
          }
          <div className="footer">
            <img src="/images/assets/footer_background.svg" alt="footer background" preserveAspectRatio="none"/>
            <p id="footer_text">Site by Adam Matheson - 1757290 - Web Tech COMSM32500</p>
          </div>
        </div>
      );
    } else if (this.state.mode === 'events') {
      return (
        <div className="App">
          <h1>Game of Thrones Events Timeline</h1>
          <h2>Events</h2>
          <div>{this.renderBtnBack(this.state.mode)}</div>
          {this.state.events.map(event =>
            <Timeline>
              <TimelineEvent
                key={event.EventID}
                title={event.Title}
                iconColor="#0D0E12"
                iconStyle={{"font-size": "12px"}}
                bubbleStyle={{height: "35px", width: "35px"}}
                icon={<i>S{event.Season}:E{event.Episode}</i>}
              >
                {this.renderEvent(event.Description)}
              </TimelineEvent>
            </Timeline>
            )
          }
          <div className="footer">
            <img src="/images/assets/footer_background.svg" alt="footer background" preserveAspectRatio="none"/>
            <p id="footer_text">Site by Adam Matheson - 1757290 - Web Tech COMSM32500</p>
          </div>
        </div>
      );
    }
  }
}

export default App;
