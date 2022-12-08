# iris_web_app
ML web app (Streamlit based) demo (MLops)

Dataset: sklearn iris
3 models:
    lin_reg = LinearRegression()
    log_reg = LogisticRegression()
    svc_m = SVC()

iris_model.py: sklearn models training
iris_web.py: streamlit webapp


Original repo: https://github.com/l33pif/iris_web_app
Original spanish video: https://www.youtube.com/watch?v=JyCE-yxeGl0

Changes:
    * Code clean
    * Dockerfile


# How to run the app

## Run once the model calculation to generate pickle files (with models)
    $ python iris_model.py 

    $ ls -1 Iris_Stremlit/*.pkl
    Iris_Stremlit/lin_reg.pkl
    Iris_Stremlit/log_reg.pkl
    Iris_Stremlit/svc_m.pkl

   $ sh setup.sh 

### If you need to clean models (delete pickle files)
    $ rm *.pkl    

## To run streamlit web

(si falla por algo de toml, borrar archivos en ~/.streamlit)
    $ streamlit run iris_web.py

  For better performance, install the Watchdog module:

  $ xcode-select --install
  $ pip install watchdog

## To run streamlit web as Docker service
### Build the Docker image
    $ docker build -t streamlit-iris-webapp .

### Run the Docker image as a service
    $ docker run -d -p 80:8501 --name iris-ml-webapp streamlit-iris-webapp
