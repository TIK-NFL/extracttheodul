#!/bin/bash
if [ -z "$1" ]; then
    echo "call with opencast src base directory"
    exit 1
fi

MHBASE=$1
if [ -e theodul ]; then 
  rm -r theodul
fi
mkdir theodul
mkdir theodul/ui
mkdir theodul/plugin

# copy provided files
cp -r provided/* theodul
cp -r provided/.htaccess theodul

# copy files from opencast
cp -r $MHBASE/modules/matterhorn-engage-theodul-core/src/main/resources/ui/* theodul/ui
rm theodul/ui/core.html
mkdir theodul/plugin/1
cp -r $MHBASE/modules/matterhorn-engage-theodul-plugin-controls/src/main/resources/static theodul/plugin/1/
mkdir theodul/plugin/2
cp -r $MHBASE/modules/matterhorn-engage-theodul-plugin-custom-mhConnection/src/main/resources/static theodul/plugin/2/
mkdir theodul/plugin/3
cp -r $MHBASE/modules/matterhorn-engage-theodul-plugin-timeline-statistics/src/main/resources/static theodul/plugin/3/
mkdir theodul/plugin/4
cp -r $MHBASE/modules/matterhorn-engage-theodul-plugin-tab-slidetext/src/main/resources/static theodul/plugin/4/
mkdir theodul/plugin/5
cp -r $MHBASE/modules/matterhorn-engage-theodul-plugin-description/src/main/resources/static theodul/plugin/5/
mkdir theodul/plugin/6
cp -r $MHBASE/modules/matterhorn-engage-theodul-plugin-video-videojs/src/main/resources/static theodul/plugin/6/
mkdir theodul/plugin/7
cp -r $MHBASE/modules/matterhorn-engage-theodul-plugin-custom-notifications/src/main/resources/static theodul/plugin/7/
mkdir theodul/plugin/8
cp -r $MHBASE/modules/matterhorn-engage-theodul-plugin-tab-description/src/main/resources/static theodul/plugin/8/
mkdir theodul/plugin/9
cp -r $MHBASE/modules/matterhorn-engage-theodul-plugin-custom-usertracking/src/main/resources/static theodul/plugin/9/
mkdir theodul/plugin/10
cp -r $MHBASE/modules/matterhorn-engage-theodul-plugin-tab-shortcuts/src/main/resources/static theodul/plugin/10/

cd theodul && patch -p1 < ../ILPATCH.patch 
mv img/loading.gif ui/img/

echo "Replace the theodul folder in templates with newly created one"
