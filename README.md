# dylanmaus

- https://jekyllrb.com/docs/installation/macos/

```bash
bundle update
bundle exec jekyll build
bundle exec jekyll serve
```

# issue with apple silicon
```
gem uninstall nokogiri
bundle config set force_ruby_platform true
bundle install
```

# Infrastructure
S3 and CloudFront

```
aws s3 sync _site/ s3://<BUCKET>/ --delete
aws cloudfront create-invalidation --distribution-id <DISTRIBUTION_ID> --paths "/*"
```
