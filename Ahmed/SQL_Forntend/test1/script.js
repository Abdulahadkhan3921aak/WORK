document.getElementById('submit').addEventListener('click', function(event) {
    const query = document.getElementById('query').value;
    if (query.trim() === '') {
      alert('Please enter a SQL query.');
      event.preventDefault(); // Prevent form submission if query is empty
    }
  });
  