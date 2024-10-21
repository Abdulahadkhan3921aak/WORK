document.addEventListener('DOMContentLoaded', function() {
    // Function to fetch random images from the server
    function fetchRandomImages() {
        // Make an AJAX request to fetch random images from the server
        fetch('fetch_images.php')
            .then(response => response.json())
            .then(data => {
                // Extract image URLs from the response data
                let images = data.images;

                // Update the slideshow with the fetched images
                updateSlideshow(images);
            })
            .catch(error => {
                console.error('Error fetching random images:', error);
            });
    }

    // Function to update the slideshow with the fetched images
    function updateSlideshow(images) {
        let currentIndex = 0;
        let slideshowInterval = 5000; // Interval in milliseconds (5 seconds)

        // Function to update the image
        function updateImage() {
            document.getElementById('slideshow-image').src = images[currentIndex];
            currentIndex = (currentIndex + 1) % images.length;
        }

        // Initial call to update the image
        updateImage();

        // Set interval to change the image
        setInterval(updateImage, slideshowInterval);
    }

    // Fetch random images when the page loads
    fetchRandomImages();
});
