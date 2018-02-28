import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types';

import { InstantSearch, Hits, SearchBox, Highlight, Snippet} from 'react-instantsearch/dom';
import Card, { CardContent, CardMedia } from 'material-ui/Card';
import Typography from 'material-ui/Typography';
import moment from 'moment';

const Event = ({hit}) => {
  const event = hit;
  return(
      <Card className="event-result-hit">
          <CardMedia image={event.image_url} className="event-img"/>
          <CardContent>
              <Typography type="headline" component="h1" className="limited event-headline">
                  <Highlight hit={event} attributeName="title"></Highlight>
              </Typography>

              <Typography type="subheading" color="secondary">
                  { event.starts_at }
                  -
                  { event.ends_at }
              </Typography>

              <Typography component="p" className="limited event-description">
                  <Snippet hit={event} attributeName="description"/>
              </Typography>

              <Typography type="caption">
                  { event.category }
              </Typography>
          </CardContent>
      </Card>
  )
};

const App = ({indexName}) =>
    <InstantSearch
        appId="PY36CLUFOH"
        apiKey="36fc837d9c5cbf561b7f36951b98db29"
        indexName={indexName}
    >
        <SearchBox/>
        <Hits hitComponent={Event}/>
    </InstantSearch>

// Needed only if your js app doesn't do it already.
// Create-react-app does it for you
let container = document.getElementById('search-container');
const indexName = container.dataset['indexname'];
ReactDOM.render(<App indexName={indexName} />, container);