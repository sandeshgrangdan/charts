## Welcome to the Helm Party! 🎉

To use the charts provided, make sure you've got your [Helm](https://helm.sh) on! 🛡️ Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, follow these steps::

### Step 1: Add the Magic Repo 🪄
```
helm repo add grangdan https://sandeshgrangdan.github.io/charts
```

If you had already added this repo earlier, just run or update to make sure you're running with the latest:
```
helm repo update
```
>You can then run `helm search repo sandeshgrangdan` to see the charts.

### Step 2: Helm to Deploy Your App 🚀

  #### Option 1: Deploy with Default Values
  If you're cool with the default settings, simply run:
  ```
  helm install my-app grangdan/app \
  --set image.repository=nginx \
  --set image.tag=latest
  ```

  #### Option 2: Deploy with Custom Values
  Want to tweak some settings? Customize your deployment by setting specific [values](https://github.com/sandeshgrangdan/charts/app/values.yaml):
  ```
  helm install my-app grangdan/app \
  -f my-values.yaml \
  --set image.repository=nginx \
  --set image.tag=latest
  ```

### Step 3: Uninstall the Chart
```
helm delete my-app
```