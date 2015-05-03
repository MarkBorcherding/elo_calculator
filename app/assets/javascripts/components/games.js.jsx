var Games = React.createClass({

  games: function(){
    return this.props.games.map(function(game){
      return <tr align="center">
              <td className="winner">
                {game.winner_name}
                ({game.winner_rating})
              </td>
              <td className="loser">
                {game.loser_name}
                ({game.loser_rating})
              </td>
              <td className="date">
                {game.created_at}
              </td>
            </tr>;
    });
  },

  render: function() {
    return <table width="100%">
            <thead>
              <tr>
                <th>
                  Humble Victor
                </th>
                <th>
                  Graceful Defeated
                </th>
                <th>
                  Date
                </th>
              </tr>
            </thead>
            <tbody>
            { this.games() }
            </tbody>
          </table>;
  }
});
