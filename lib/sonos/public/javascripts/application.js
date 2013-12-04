app = angular.module("sonos", ["ngResource"]);

app.directive('a', function() {
  return {
    restrict: 'E',
  link: function(scope, elem, attrs) {
    if(attrs.ngClick || attrs.href === '' || attrs.href === '#'){
      elem.on('click', function(e){
        e.preventDefault();
        if(attrs.ngClick){
          scope.$eval(attrs.ngClick);
        }
      });
    }
  }
  };
});

app.factory('Speakers', function($resource) {
  return $resource('/speakers/:id', {
    id: "@id"
  });
});

app.factory('Playlist', function($resource) {
  return $resource('/playlist/:id', {
    id: "@id"
  });
});

var speaker = undefined;


app.controller("AppCtrl", function($scope, Speakers, Playlist) {
  $scope.speakers = Speakers.query();
  $scope.playlist = [];

  $scope.getPlaylist = function(id) {
    $scope.playlist = Playlist.get({id: id});
  }
});
