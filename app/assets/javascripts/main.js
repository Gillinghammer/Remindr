(function(){

  var app = angular.module('drinkyApp',['ngAnimate'])


  app.controller('DrinkyController',["$scope", "$http",  function($scope, $http){

    $scope.myContacts = [];

    $scope.showAddFriend = true;

// DEFINE FUNCTIONS HERE
    $scope.getContacts = function(){
      $http.get('/users/1/contacts.json').success(function(data){
        $scope.myContacts = data['contacts']

        angular.forEach($scope.myContacts, function(value, key){
          if (value['last_meeting'] == null) {
            value['last_meeting'] = "No meetings recorded"
          } else {
            value['last_meeting'] = moment(value.last_meeting).fromNow();
          };
          value['days'] = moment(value.remind_on).diff(moment(), 'days') + 1;
        });


        console.log($scope.myContacts);
      });
    };

    $scope.addContact = function(){
      contactName = $('#nameField').val()
      contactEmail = $('#emailField').val()
      contactAvatar = $('#avatarField').val()
      selectedInterval = parseInt($('#intervalField').val());
      contactType = $('#contactTypeField').val();
      $http.post('/users/1/contacts.json', 
        {
          name: contactName, 
          email: contactEmail,
          avatar: contactAvatar,
          contact_type: contactType,
          remind_interval: selectedInterval,
          user_id: 1
        }).success(function(data){
          $scope.showAddFriend = true;
          $scope.getContacts();
          $('#nameField').val("");
          $('#emailField').val("");
          $('#avatarField').val("");
        })
    };
    $scope.removeContact = function(contact){

        $http.delete('/users/1/contacts/'+contact.id+'.json').success(function(data){
          console.log('Contact removed');
          $scope.getContacts();
        });
    };

    $scope.recordDrink = function(contact){
      $http.post('/users/1/meetings.json',
      {
        user_id: 1,
        contact_id: contact.id
      }).success(function(data){
        console.log("meeting recorded");
        $scope.getContacts();
      })
    }

    $scope.flip = function(contact){
      $scope.flipId = contact.id;
      console.log($scope.flipId);
    }

// CALL FUNCTIONS HERE

$scope.getContacts();

  }]);

})();