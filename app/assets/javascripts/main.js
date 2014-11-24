(function(){

  var app = angular.module('drinkyApp',[])


  app.controller('DrinkyController',["$scope", "$http",  function($scope, $http){
    var userId = window.location.pathname.split('/').pop();
    $scope.myContacts = [];

    $scope.slide = false;

// DEFINE FUNCTIONS HERE

    $scope.getContacts = function(){
      $http.get('/users/'+ userId + '/contacts.json').success(function(data){
        $scope.myContacts = data['contacts']
        angular.forEach($scope.myContacts, function(value, key){
          if (value['last_meeting'] == null) {
            value['last_meeting'] = "--"
            value['days'] = value.remind_interval;
          } else {
            value['last_meeting'] = moment(value.last_meeting).format('dddd');
            value['days'] = moment(value.remind_on).diff(moment(), 'days');
          };
          
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
      $http.post('/users/' + userId + '/contacts.json', 
        {
          name: contactName, 
          email: contactEmail,
          avatar: contactAvatar,
          contact_type: contactType,
          remind_interval: selectedInterval,
          user_id: userId
        }).success(function(data){
          $scope.getContacts();
          $('#nameField').val("");
          $('#emailField').val("");
          $('#avatarField').val("");
          $('#intervalField').val("");
          $('#contactTypeField').val("Professional");
          $( "#addContact" ).slideToggle( 300 );
        })
    };
    $scope.removeContact = function(contact){

        $http.delete('/users/'+ userId + '/contacts/'+contact.id+'.json').success(function(data){
          console.log('Contact removed');
          $scope.getContacts();
        });
    };

    $scope.recordDrink = function(contact){
      $http.post('/users/' + userId + '/meetings.json',
      {
        user_id: userId,
        contact_id: contact.id
      }).success(function(data){
        console.log("meeting recorded");
        $scope.getContacts();
      })
    }

    $scope.flip = function(contact){
      $scope.flipId = contact.id;
    }

    $scope.clearFlip = function(){
      $scope.flipId = false;
      console.log('mouse left');
    }
    // slideDown animation for adding a new contact
    $('#addContactButton').click(function(){
      $( "#addContact" ).slideToggle( 300 );
    });
// CALL FUNCTIONS HERE

$scope.getContacts();

  }]);

})();