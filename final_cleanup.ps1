# Final cleanup script for all remaining blog detail files
$files = Get-ChildItem -Path "blog-detail-*.html"

foreach ($file in $files) {
    Write-Host "Processing $($file.Name)..."
    
    # Read the file content
    $content = Get-Content $file.FullName -Raw
    
    # Check if the post section still exists
    if ($content -match '<div class="post">\s*<div class="author">.*?</div>\s*<div class="date-comment">.*?</div>\s*</div>') {
        # Remove the post section with author and date
        $newContent = $content -replace '<div class="post">\s*<div class="author">.*?</div>\s*<div class="date-comment">.*?</div>\s*</div>', ''
        
        # Write the modified content back to the file
        Set-Content $file.FullName -Value $newContent -NoNewline
        
        Write-Host "Updated $($file.Name)"
    } else {
        Write-Host "No post section found in $($file.Name) - already processed"
    }
}

Write-Host "All files processed successfully!" 