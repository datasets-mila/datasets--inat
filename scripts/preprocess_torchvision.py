import torchvision

torchvision.datasets.INaturalist(".", version="2021_train", target_type="full", download=True)
torchvision.datasets.INaturalist(".", version="2021_train_mini", target_type="full", download=True)
torchvision.datasets.INaturalist(".", version="2021_valid", target_type="full", download=True)
