document.addEventListener('DOMContentLoaded', () => {
    const completeButtons = document.querySelectorAll('.btn-success');
    completeButtons.forEach(button => {
        button.addEventListener('click', () => {
            const audio = new Audio('path/to/your/sound/effect.mp3');
            audio.play();
        });
    });
});
document.addEventListener('DOMContentLoaded', () => {
    const completeButtons = document.querySelectorAll('.btn-success');
    const mascotImage = document.getElementById('mascotImage');

    completeButtons.forEach(button => {
        button.addEventListener('click', () => {
            mascotImage.style.display = 'block';
            mascotImage.classList.add('dance'); // Add CSS class for dance animation
            setTimeout(() => {
                mascotImage.style.display = 'none';
            }, 3000); // Hide after 3 seconds
        });
    });
});
