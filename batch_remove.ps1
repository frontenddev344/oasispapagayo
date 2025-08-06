# Batch script to remove post sections from all remaining blog detail files
$files = @(
    "blog-detail-13.html", "blog-detail-14.html", "blog-detail-15.html", "blog-detail-16.html", 
    "blog-detail-17.html", "blog-detail-18.html", "blog-detail-19.html", "blog-detail-20.html", 
    "blog-detail-21.html", "blog-detail-22.html", "blog-detail-23.html", "blog-detail-24.html", 
    "blog-detail-25.html", "blog-detail-26.html", "blog-detail-27.html", "blog-detail-28.html", 
    "blog-detail-29.html"
)

foreach ($file in $files) {
    if (Test-Path $file) {
        Write-Host "Processing $file..."
        
        # Read the file content
        $content = Get-Content $file -Raw
        
        # Remove the post section with author and date
        $pattern = '<div class="post">\s*<div class="author">.*?</div>\s*<div class="date-comment">.*?</div>\s*</div>'
        $newContent = $content -replace $pattern, ''
        
        # Write the modified content back to the file
        Set-Content $file -Value $newContent -NoNewline
        
        Write-Host "Completed $file"
    }
}

Write-Host "All remaining files processed successfully!" 