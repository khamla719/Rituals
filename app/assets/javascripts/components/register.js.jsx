var Register = React.createClass({
  render: function(){
    return (<form action="/users" method="post">
      <input type="text" name="user[email]" placeholder="Email"/><br/>
      <input type="text" name="user[first_name]" placeholder="First Name"/><br/>
      <input type="text" name="user[last_name]" placeholder="Last Name"/><br/>
      <input type="password" name="user[password]" placeholder="Password"/><br/>
      <input type="password" name="user[password_confirmation]" placeholder="Password Confirmation"/><br/>
      <input type="submit" value="Register"/>
      </form>);
  }
});