# PowerShell script to remove post section from all blog detail pages
$files = Get-ChildItem -Path "blog-detail-*.html"

foreach ($file in $files) {
    Write-Host "Processing $($file.Name)..."
    
    # Read the file content
    $content = Get-Content $file.FullName -Raw
    
    # Remove the post section with author and date
    $pattern = '<div class="post">\s*<div class="author">.*?</div>\s*<div class="date-comment">.*?</div>\s*</div>'
    $newContent = $content -replace $pattern, ''
    
    # Write the modified content back to the file
    Set-Content $file.FullName -Value $newContent -NoNewline
    
    Write-Host "Completed $($file.Name)"
}

Write-Host "All files processed successfully!" 