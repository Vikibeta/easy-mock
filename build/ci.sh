set -e
echo "{\"db\": \"mongodb://localhost/easy-mock\", \"jwt\": { \"secret\": \"test\" }}" > ./config/test.json
npm run lint
npm test

# report coverage stats for non-PRs
if [[ -z $CI_PULL_REQUEST ]]; then
  cat ./coverage/lcov.info | ./node_modules/.bin/codecov
fi
